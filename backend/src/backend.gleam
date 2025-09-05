import gleam/dynamic/decode
import gleam/erlang/process
import gleam/io
import gleam/json
import gleam/list
import gleam/option.{Some}
import gleam/otp/actor
import gleam/string
import mist
import pog
import types/episode.{type Character, type Episode, type Organization}
import wisp.{type Request, type Response}
import wisp/wisp_mist

// データベース接続設定
fn create_db_config() -> pog.Config {
  let pool_name = process.new_name(prefix: "episode_api")
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
    rows_as_map: True,
  )
}

// データベースからepisodesを取得
fn get_episodes_from_db() -> Result(List(Episode), String) {
  let config = create_db_config()

  case pog.start(config) {
    Ok(actor.Started(_pid, connection)) -> {
      io.println("✅ Successfully connected to PostgreSQL")

      let query =
        pog.query(
          "SELECT season, episode, title, title_ja, importance, netflix_id, netflix_synopsis, url_imdb, characters::text, organizations::text FROM episodes ORDER BY season, episode",
        )
        |> pog.returning(episode_decoder())

      case pog.execute(query, connection) {
        Ok(returned) -> {
          let episodes = returned.rows
          io.println(
            "✅ Successfully retrieved "
            <> string.inspect(list.length(episodes))
            <> " episodes from database",
          )
          io.println(
            "📊 First episode data: " <> string.inspect(list.first(episodes)),
          )
          Ok(episodes)
        }
        Error(err) -> {
          Error("Failed to query episodes: " <> string.inspect(err))
        }
      }
    }
    Error(err) -> {
      Error("Failed to connect to database: " <> string.inspect(err))
    }
  }
}

// Episodeデコーダー
fn episode_decoder() -> decode.Decoder(Episode) {
  use season <- decode.field("season", decode.int)
  use episode <- decode.field("episode", decode.int)
  use title <- decode.field("title", decode.string)
  use title_ja <- decode.field("title_ja", decode.string)
  use importance <- decode.field("importance", decode.int)
  use netflix_id <- decode.field("netflix_id", decode.int)
  use netflix_synopsis <- decode.field("netflix_synopsis", decode.string)
  use url_imdb <- decode.field("url_imdb", decode.string)
  use characters_json <- decode.field("characters", decode.string)
  use organizations_json <- decode.field("organizations", decode.string)

  // JSON文字列からcharactersとorganizationsをパース
  let characters = case json.parse(characters_json, characters_decoder()) {
    Ok(chars) -> {
      io.println(
        "✅ Successfully parsed characters: "
        <> string.inspect(list.length(chars)),
      )
      chars
    }
    Error(err) -> {
      io.println("❌ Failed to parse characters: " <> string.inspect(err))
      []
    }
  }

  let organizations = case
    json.parse(organizations_json, organizations_decoder())
  {
    Ok(orgs) -> {
      io.println(
        "✅ Successfully parsed organizations: "
        <> string.inspect(list.length(orgs)),
      )
      orgs
    }
    Error(err) -> {
      io.println("❌ Failed to parse organizations: " <> string.inspect(err))
      []
    }
  }

  decode.success(episode.Episode(
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

// Charactersデコーダー
fn characters_decoder() -> decode.Decoder(List(Character)) {
  use chars <- decode.field("characters", decode.list(character_decoder()))
  decode.success(chars)
}

// Organizationsデコーダー
fn organizations_decoder() -> decode.Decoder(List(Organization)) {
  use orgs <- decode.field("organizations", decode.list(organization_decoder()))
  decode.success(orgs)
}

fn character_decoder() -> decode.Decoder(Character) {
  use name <- decode.field("name", decode.string)
  use contrast <- decode.field("contrast", decode.int)
  decode.success(episode.Character(name: name, contrast: contrast))
}

fn organization_decoder() -> decode.Decoder(Organization) {
  use name <- decode.field("name", decode.string)
  use contrast <- decode.field("contrast", decode.int)
  decode.success(episode.Organization(name: name, contrast: contrast))
}

// EpisodeをJSONに変換
fn episode_to_json(episode: Episode) -> json.Json {
  json.object([
    #("season", json.int(episode.season)),
    #("episode", json.int(episode.episode)),
    #("title", json.string(episode.title)),
    #("title_ja", json.string(episode.title_ja)),
    #("importance", json.int(episode.importance)),
    #("netflix_id", json.int(episode.netflix_id)),
    #("netflix_synopsis", json.string(episode.netflix_synopsis)),
    #("url_imdb", json.string(episode.url_imdb)),
    #("characters", json.array(episode.characters, character_to_json)),
    #("organizations", json.array(episode.organizations, organization_to_json)),
  ])
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

// メイン関数
pub fn main() {
  io.println("🚀 Starting Star Trek DS9 API Server...")

  // Wispサーバー起動
  let secret_key_base = wisp.random_string(64)
  let handler = wisp_mist.handler(handle_request, secret_key_base)
  let assert Ok(_) = mist.new(handler) |> mist.port(8001) |> mist.start

  io.println("📡 Server running on http://localhost:8001")

  process.sleep_forever()
}

// リクエストハンドラー
fn handle_request(req: Request) -> Response {
  use <- cors_middleware

  case wisp.path_segments(req) {
    [] -> handle_episodes(req)
    ["episodes"] -> handle_episodes(req)
    _ -> wisp.not_found()
  }
}

// CORSミドルウェア
fn cors_middleware(handler: fn() -> Response) -> Response {
  handler()
  |> wisp.set_header("access-control-allow-origin", "*")
  |> wisp.set_header("access-control-allow-methods", "GET, POST, OPTIONS")
  |> wisp.set_header("access-control-allow-headers", "content-type")
}

// エピソードAPIハンドラー
fn handle_episodes(_req: Request) -> Response {
  io.println("📥 Received request for episodes")

  // データベースからepisodesを取得
  case get_episodes_from_db() {
    Ok(episodes) -> {
      io.println("✅ Successfully retrieved episodes from database")
      let episodes_json = json.array(episodes, episode_to_json)
      wisp.ok()
      |> wisp.set_header("content-type", "application/json")
      |> wisp.string_body(json.to_string(episodes_json))
    }
    Error(err) -> {
      io.println_error("❌ Failed to retrieve episodes from database: " <> err)
      let error_data =
        json.object([
          #("error", json.string("Database query failed")),
          #("message", json.string(err)),
        ])
      wisp.internal_server_error()
      |> wisp.set_header("content-type", "application/json")
      |> wisp.string_body(json.to_string(error_data))
    }
  }
}
