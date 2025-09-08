import gleam/json
import gleam/list
import gleeunit
import gleeunit/should
import types/episode

pub fn main() {
  gleeunit.main()
}

// JSON Decoding Tests ------------------------------------------------------------------------

// Test gleam/dynamic/decode based JSON decoder
pub fn decode_episode_test() {
  let json_string =
    "{
    \"season\": 1,
    \"episode\": 1,
    \"title\": \"Emissary\",
    \"title_ja\": \"聖なる神殿の謎\",
    \"importance\": 4,
    \"netflix_id\": 70205806
  }"

  let result = episode.decode_episode(json_string)

  case result {
    Ok(ep) -> {
      ep.season |> should.equal(1)
      ep.episode |> should.equal(1)
      ep.title |> should.equal("Emissary")
      ep.title_ja |> should.equal("聖なる神殿の謎")
      ep.importance |> should.equal(4)
      ep.netflix_id |> should.equal(70_205_806)
    }
    Error(_) -> should.fail()
  }
}

// Test gleam/dynamic/decode based JSON decoder
pub fn decode_episodes_from_json_test() {
  let sample_json =
    "[{
    \"season\":1,
    \"episode\":1,
    \"title\":\"Emissary\",
    \"title_ja\":\"聖なる神殿の謎\",
    \"importance\":4,
    \"netflix_id\":70205806
    }]"

  let result = json.parse(sample_json, episode.episodes_decoder())

  case result {
    Ok(episodes) -> {
      episodes |> list.length() |> should.not_equal(0)
      case episodes {
        [first, ..] -> {
          first.season |> should.equal(1)
          first.episode |> should.equal(1)
          first.title |> should.equal("Emissary")
        }
        [] -> should.fail()
      }
    }
    Error(_) -> should.fail()
  }
}
