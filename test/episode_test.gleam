import gleam/json
import gleam/list
import gleeunit
import gleeunit/should
import types/character
import types/episode
import types/organization

pub fn main() {
  gleeunit.main()
}

pub fn episode_types_test() {
  let name_contrast = episode.NameAndContrast("Benjamin Sisko", 85)
  name_contrast.name |> should.equal("Benjamin Sisko")
  name_contrast.contrast |> should.equal(85)

  let char_contrast = episode.CharacterAndContrast(character.BenjaminSisko, 90)
  char_contrast.character |> should.equal(character.BenjaminSisko)
  char_contrast.contrast |> should.equal(90)

  let org_contrast =
    episode.OrganizationAndContrast(organization.Federation(""), 75)
  org_contrast.organization |> should.equal(organization.Federation(""))
  org_contrast.contrast |> should.equal(75)
}

pub fn episode_creation_test() {
  let ep =
    episode.Episode(
      season: 1,
      episode: 1,
      title: "Emissary",
      title_ja: "聖なる神殿の謎",
      importance: 90,
      netflix_id: 12_345,
      characters: [],
      organizations: [],
    )

  ep.season |> should.equal(1)
  ep.episode |> should.equal(1)
  ep.title |> should.equal("Emissary")
  ep.title_ja |> should.equal("聖なる神殿の謎")
  ep.importance |> should.equal(90)
  ep.netflix_id |> should.equal(12_345)
}

// Test gleam/dynamic/decode based JSON decoder
pub fn decode_name_and_contrast_test() {
  let json_string = "{\"name\": \"Benjamin Sisko\", \"contrast\": 85}"

  let result = episode.decode_name_and_contrast(json_string)

  result
  |> should.be_ok()
  |> should.equal(episode.NameAndContrast("Benjamin Sisko", 85))
}

// Test gleam/dynamic/decode based JSON decoder
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

// Test gleam/dynamic/decode based JSON decoder
pub fn decode_episodes_from_json_test() {
  let sample_json =
    "[{\"season\":1,\"episode\":1,\"title\":\"Emissary\",\"title_ja\":\"聖なる神殿の謎\",\"importance\":4,\"netflix_id\":70205806,\"characters\":[{\"name\":\"Benjamin Sisko\",\"contrast\":4},{\"name\":\"Dax\",\"contrast\":4}],\"organizations\":[{\"name\":\"Federation\",\"contrast\":5},{\"name\":\"Bajor\",\"contrast\":5}]}]"

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

// Test character string conversion with gleam/dynamic/decode
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

// Test organization string conversion with gleam/dynamic/decode
pub fn organization_conversion_test() {
  // Test organization to string with role
  organization.Federation("")
  |> organization.to_string()
  |> should.equal("Federation")

  // Test string to organization
  "Federation"
  |> organization.from_string()
  |> should.be_ok()
  |> fn(result) {
    case result {
      organization.Federation(_) -> True
      _ -> False
    }
  }
  |> should.equal(True)

  // Test invalid organization string
  "Invalid Organization"
  |> organization.from_string()
  |> should.be_error()
}
