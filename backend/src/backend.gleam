import gleam/erlang/process
import gleam/io
import gleam/json
import gleam/string
import mist
import simplifile
import wisp.{type Request, type Response}
import wisp/wisp_mist

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

  // 既存のJSONファイルを読み込んで返す
  let json_file_path = "../app/priv/static/episodes.json"

  case simplifile.read(json_file_path) {
    Ok(json_content) -> {
      io.println("✅ Successfully read episodes JSON file")
      wisp.ok()
      |> wisp.set_header("content-type", "application/json")
      |> wisp.string_body(json_content)
    }
    Error(err) -> {
      io.println_error(
        "❌ Failed to read episodes JSON file: " <> string.inspect(err),
      )
      let error_data =
        json.object([
          #("error", json.string("File read failed")),
          #("message", json.string(string.inspect(err))),
        ])
      wisp.internal_server_error()
      |> wisp.set_header("content-type", "application/json")
      |> wisp.string_body(json.to_string(error_data))
    }
  }
}
