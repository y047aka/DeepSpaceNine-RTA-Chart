import fixtures/episodes as fixture_episodes
import gleam/dynamic/decode
import gleam/erlang/process
import gleam/int
import gleam/io
import gleam/json
import gleam/list
import gleam/option.{Some}
import gleam/otp/actor
import gleam/string
import pog
import simplifile
import types/episode.{
  type Character, type Episode, type Organization, Character, Episode,
  Organization, sample_episodes,
}

pub fn main() {
  io.println("🚀 Starting episode migration with fixture priority...")

  // Priority: Use development fixture data first
  let episodes = fixture_episodes.development_episodes()
  let total_episodes = list.length(episodes)
  io.println(
    "📊 Using "
    <> int.to_string(total_episodes)
    <> " development fixture episodes",
  )

  // PostgreSQL migration with fixture data
  let migration_result = migrate_episodes_to_postgres(episodes)
  case migration_result {
    Ok(migrated_count) -> {
      io.println("✅ Fixture migration completed successfully!")
      io.println(
        "📈 Migrated "
        <> int.to_string(migrated_count)
        <> " episodes from fixture",
      )
    }
    Error(err) -> {
      io.println_error("❌ Fixture migration failed: " <> string.inspect(err))

      // Fallback: Try to read JSON file
      io.println("🔄 Attempting fallback to JSON file...")
      let episodes_result = load_episodes_from_json()

      case episodes_result {
        Ok(json_episodes) -> {
          let json_total = list.length(json_episodes)
          io.println(
            "📁 Successfully loaded "
            <> int.to_string(json_total)
            <> " episodes from JSON file",
          )

          let json_migration_result =
            migrate_episodes_to_postgres(json_episodes)
          case json_migration_result {
            Ok(migrated_count) -> {
              io.println("✅ JSON fallback migration completed successfully!")
              io.println(
                "📈 Migrated "
                <> int.to_string(migrated_count)
                <> " episodes from JSON",
              )
            }
            Error(json_err) -> {
              io.println_error(
                "❌ JSON migration failed: " <> string.inspect(json_err),
              )
            }
          }
        }
        Error(json_err) -> {
          io.println_error("❌ Failed to load JSON file: " <> json_err)
          io.println(
            "💡 Consider using only fixture data or checking JSON file path",
          )
        }
      }
    }
  }
}

fn migrate_episodes_to_postgres(episodes: List(Episode)) -> Result(Int, String) {
  io.println("Starting PostgreSQL migration...")

  // Create PostgreSQL connection configuration
  let pool_name = process.new_name(prefix: "episode_migration")
  let config =
    pog.Config(
      pool_name: pool_name,
      host: "postgres",
      port: 5432,
      database: "app_db",
      user: "user",
      password: Some("passw0rd"),
      ssl: pog.SslDisabled,
      connection_parameters: [],
      pool_size: 5,
      queue_target: 50,
      queue_interval: 1000,
      idle_interval: 1000,
      trace: False,
      ip_version: pog.Ipv4,
      rows_as_map: False,
    )

  // Start connection pool
  case pog.start(config) {
    Ok(actor.Started(_pid, connection)) -> {
      io.println("Successfully connected to PostgreSQL")

      // Migrate episodes
      case insert_episodes(connection, episodes) {
        Ok(count) -> {
          io.println("Migration completed successfully!")
          Ok(count)
        }
        Error(err) -> {
          Error("Migration failed: " <> string.inspect(err))
        }
      }
    }
    Error(err) -> {
      Error("Failed to connect to PostgreSQL: " <> string.inspect(err))
    }
  }
}

// JSON decoders for episodes, characters, and organizations
fn episodes_decoder() -> decode.Decoder(List(Episode)) {
  decode.list(episode_decoder())
}

fn episode_decoder() -> decode.Decoder(Episode) {
  use season <- decode.field("season", decode.int)
  use episode <- decode.field("episode", decode.int)
  use title <- decode.field("title", decode.string)
  use title_ja <- decode.field("title_ja", decode.optional(decode.string))
  use importance <- decode.field("importance", decode.int)
  use netflix_id <- decode.field("netflix_id", decode.optional(decode.int))
  use netflix_synopsis <- decode.field(
    "netflix_synopsis",
    decode.optional(decode.string),
  )
  use url_imdb <- decode.field("url_imdb", decode.optional(decode.string))
  use characters <- decode.field("characters", decode.list(character_decoder()))
  use organizations <- decode.field(
    "organizations",
    decode.list(organization_decoder()),
  )

  decode.success(Episode(
    season: season,
    episode: episode,
    title: title,
    title_ja: title_ja,
    importance: importance,
    netflix_id: netflix_id,
    netflix_synopsis: netflix_synopsis,
    url_imdb: url_imdb,
    characters: characters,
    organizations: organizations,
  ))
}

fn character_decoder() -> decode.Decoder(Character) {
  use name <- decode.field("name", decode.string)
  use contrast <- decode.field("contrast", decode.int)
  decode.success(Character(name: name, contrast: contrast))
}

fn organization_decoder() -> decode.Decoder(Organization) {
  use name <- decode.field("name", decode.string)
  use contrast <- decode.field("contrast", decode.int)
  decode.success(Organization(name: name, contrast: contrast))
}

// PostgreSQL migration functions
fn insert_episodes(
  connection: pog.Connection,
  episodes: List(Episode),
) -> Result(Int, pog.QueryError) {
  io.println("Inserting episodes into PostgreSQL...")

  let insert_sql =
    "
    INSERT INTO episodes (
      season, episode, title, title_ja, importance,
      netflix_id, netflix_synopsis, url_imdb,
      characters, organizations
    ) VALUES (
      $1, $2, $3, $4, $5, $6, $7, $8, $9, $10
    )
    ON CONFLICT (season, episode) DO NOTHING
  "

  case try_insert_all(connection, insert_sql, episodes, 0) {
    Ok(count) -> Ok(count)
    Error(err) -> Error(err)
  }
}

fn try_insert_all(
  connection: pog.Connection,
  sql: String,
  episodes: List(Episode),
  count: Int,
) -> Result(Int, pog.QueryError) {
  case episodes {
    [] -> Ok(count)
    [episode, ..rest] -> {
      case insert_episode(connection, sql, episode) {
        Ok(_) -> {
          case count % 25 == 0 {
            True ->
              io.println("Processed " <> int.to_string(count) <> " episodes...")
            False -> Nil
          }
          try_insert_all(connection, sql, rest, count + 1)
        }
        Error(err) -> Error(err)
      }
    }
  }
}

fn insert_episode(
  connection: pog.Connection,
  sql: String,
  episode: Episode,
) -> Result(pog.Returned(Nil), pog.QueryError) {
  // Convert characters and organizations to JSON strings for JSONB storage
  let characters_json =
    json.to_string(
      json.object([
        #("characters", json.array(episode.characters, character_to_json)),
      ]),
    )

  let organizations_json =
    json.to_string(
      json.object([
        #(
          "organizations",
          json.array(episode.organizations, organization_to_json),
        ),
      ]),
    )

  let query =
    pog.query(sql)
    |> pog.parameter(pog.int(episode.season))
    |> pog.parameter(pog.int(episode.episode))
    |> pog.parameter(pog.text(episode.title))
    |> pog.parameter(pog.text(episode.title_ja))
    |> pog.parameter(pog.int(episode.importance))
    |> pog.parameter(pog.int(episode.netflix_id))
    |> pog.parameter(pog.text(episode.netflix_synopsis))
    |> pog.parameter(pog.text(episode.url_imdb))
    |> pog.parameter(pog.text(characters_json))
    |> pog.parameter(pog.text(organizations_json))
    |> pog.returning(decode.success(Nil))

  pog.execute(query, connection)
}

fn character_to_json(character: Character) -> json.Json {
  json.object([
    #("name", json.string(character.name)),
    #("contrast", json.int(character.contrast)),
  ])
}

fn organization_to_json(organization: Organization) -> json.Json {
  json.object([
    #("name", json.string(organization.name)),
    #("contrast", json.int(organization.contrast)),
  ])
}

fn load_episodes_from_json() -> Result(List(Episode), String) {
  let json_file_path = "../frontend/priv/static/episodes.json"

  case simplifile.read(json_file_path) {
    Ok(json_content) -> {
      io.println("Successfully read JSON file")
      io.println(
        "JSON content length: " <> int.to_string(string.length(json_content)),
      )

      // Parse JSON using Gleam's json.parse and decode
      io.println("Parsing JSON content...")
      case json.parse(json_content, episodes_decoder()) {
        Ok(episodes) -> {
          io.println(
            "Successfully parsed "
            <> int.to_string(list.length(episodes))
            <> " episodes from JSON",
          )
          Ok(episodes)
        }
        Error(parse_err) -> {
          io.println_error(
            "Failed to parse JSON: " <> string.inspect(parse_err),
          )
          io.println("Falling back to sample data")
          Ok(sample_episodes())
        }
      }
    }
    Error(err) -> {
      Error("Failed to read JSON file: " <> string.inspect(err))
    }
  }
}
