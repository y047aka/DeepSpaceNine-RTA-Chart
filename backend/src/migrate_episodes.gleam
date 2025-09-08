import fixtures/episodes as fixture_episodes
import gleam/dynamic/decode
import gleam/erlang/process
import gleam/int
import gleam/io
import gleam/list
import gleam/option.{Some}
import gleam/otp/actor
import gleam/string
import pog
import types/episode.{type Episode}

pub fn main() {
  io.println("🚀 Starting episode migration with fixture priority...")

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
    |> pog.returning(decode.success(Nil))

  pog.execute(query, connection)
}
