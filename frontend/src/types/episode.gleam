import gleam/dynamic/decode
import gleam/json

pub type Episode {
  Episode(
    season: Int,
    episode: Int,
    title: String,
    title_ja: String,
    importance: Int,
    netflix_id: Int,
  )
}

pub fn episodes_decoder() -> decode.Decoder(List(Episode)) {
  decode.list(episode_decoder())
}

// Main episode decoder (like Elm's episodeDecoder)
fn episode_decoder() -> decode.Decoder(Episode) {
  use season <- decode.field("season", decode.int)
  use episode_num <- decode.field("episode", decode.int)
  use title <- decode.field("title", decode.string)
  use title_ja <- decode.field("title_ja", decode.string)
  use importance <- decode.field("importance", decode.int)
  use netflix_id <- decode.field("netflix_id", decode.int)

  decode.success(Episode(
    season: season,
    episode: episode_num,
    title: title,
    title_ja: title_ja,
    importance: importance,
    netflix_id: netflix_id,
  ))
}

pub fn decode_episode(json_string: String) -> Result(Episode, json.DecodeError) {
  json.parse(json_string, episode_decoder())
}
