import gleam/list
import gleeunit
import gleeunit/should
import types/character
import types/episode
import types/organization

pub fn main() {
  gleeunit.main()
}

// TDD Red Phase: This test will fail until we implement the decoder
pub fn decode_name_and_contrast_test() {
  let json_string = "{\"name\": \"Benjamin Sisko\", \"contrast\": 85}"

  let result = episode.decode_name_and_contrast(json_string)

  result
  |> should.be_ok()
  |> should.equal(episode.NameAndContrast("Benjamin Sisko", 85))
}

// TDD Red Phase: This test will fail until we implement the decoder
pub fn decode_episode_test() {
  let json_string =
    "{
    \"season\": 1,
    \"episode\": 1,
    \"title\": \"Emissary\",
    \"title_ja\": \"聖なる神殿の謎\",
    \"importance\": 4,
    \"netflix_id\": 70205806,
    \"characters\": [
      {\"name\": \"Benjamin Sisko\", \"contrast\": 4},
      {\"name\": \"Dax\", \"contrast\": 4}
    ],
    \"organizations\": [
      {\"name\": \"Federation\", \"contrast\": 5},
      {\"name\": \"Bajor\", \"contrast\": 5}
    ]
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
      // Check lists have correct length
      ep.characters |> list.length() |> should.equal(2)
      ep.organizations |> list.length() |> should.equal(2)
    }
    Error(_) -> should.fail()
  }
}

// TDD Red Phase: This test will fail until we implement the decoder
pub fn decode_episodes_from_js_test() {
  // This will test loading from the actual episodes.js file
  let result = episode.decode_episodes_from_js()

  case result {
    Ok(episodes) -> {
      // Check episodes list is not empty
      episodes |> list.length() |> should.not_equal(0)
      // Test that first episode has expected structure
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

// TDD Red Phase: Test for character string conversion
pub fn character_conversion_test() {
  // Test character to string
  character.BenjaminSisko
  |> character.to_string()
  |> should.equal("Benjamin Sisko")

  // Test string to character
  "Benjamin Sisko"
  |> character.from_string()
  |> should.be_ok()
  |> should.equal(character.BenjaminSisko)

  // Test invalid character string
  "Invalid Character"
  |> character.from_string()
  |> should.be_error()
}

// TDD Red Phase: Test for organization string conversion
pub fn organization_conversion_test() {
  // Test organization to string
  organization.Federation
  |> organization.to_string()
  |> should.equal("Federation")

  // Test string to organization
  "Federation"
  |> organization.from_string()
  |> should.be_ok()
  |> should.equal(organization.Federation)

  // Test invalid organization string
  "Invalid Organization"
  |> organization.from_string()
  |> should.be_error()
}
