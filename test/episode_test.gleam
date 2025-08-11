import components/histogram
import gleam/json
import gleam/list
import gleeunit
import gleeunit/should
import types/character
import types/episode
import types/organization
import types/role

pub fn main() {
  gleeunit.main()
}

// JSON Decoding Tests ------------------------------------------------------------------------

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

pub fn character_conversion_test() {
  // Test direct Character access
  character.benjamin_sisko.name
  |> should.equal("Benjamin Sisko")

  // Test string to Character
  case character.get_character_by_name("Benjamin Sisko") {
    Ok(char_data) -> {
      char_data.name |> should.equal("Benjamin Sisko")
    }
    Error(_) -> should.fail()
  }

  // Test invalid character string
  character.get_character_by_name("Invalid Character")
  |> should.be_error()
}

// String Conversion Tests ------------------------------------------------------------------------

// Test organization string conversion with new default role system
pub fn organization_conversion_test() {
  // Test organization to string with role
  organization.Federation(role.Starfleet(role.Operations))
  |> organization.to_string()
  |> should.equal("Federation")

  // Test string to organization - now returns default role
  "Federation"
  |> organization.from_string()
  |> should.equal(Ok(organization.Federation(role.Citizen)))

  // Test Bajor string to organization with default role
  "Bajor"
  |> organization.from_string()
  |> should.equal(Ok(organization.Bajor))

  // Test invalid organization string
  "Invalid Organization"
  |> organization.from_string()
  |> should.be_error()
}

pub fn organization_default_roles_test() {
  // Test that string parsing gives default roles
  case organization.from_string("Federation") {
    Ok(org) ->
      case org {
        organization.Federation(role) -> role |> should.equal(role.Citizen)
        _ -> should.fail()
      }
    Error(_) -> should.fail()
  }

  case organization.from_string("Bajor") {
    Ok(org) ->
      case org {
        organization.Bajor -> should.equal(True, True)
        _ -> should.fail()
      }
    Error(_) -> should.fail()
  }
}

// Episode Integration Tests ------------------------------------------------------------------------

fn create_test_episodes() {
  [
    episode.Episode(
      season: 1,
      episode: 1,
      title: "Emissary",
      title_ja: "エミサリー",
      importance: 4,
      netflix_id: 1,
      characters: [
        episode.CharacterAndContrast(character.benjamin_sisko, 4),
        episode.CharacterAndContrast(character.kira_nerys, 3),
      ],
      organizations: [
        episode.OrganizationAndContrast(
          organization.Federation(role.Starfleet(role.Operations)),
          4,
        ),
        episode.OrganizationAndContrast(organization.Bajor, 3),
      ],
    ),
    episode.Episode(
      season: 1,
      episode: 2,
      title: "Test Episode",
      title_ja: "テストエピソード",
      importance: 2,
      netflix_id: 2,
      characters: [
        episode.CharacterAndContrast(character.dax, 2),
      ],
      organizations: [
        episode.OrganizationAndContrast(organization.DominionForces, 2),
      ],
    ),
  ]
}

pub fn get_character_episodes_test() {
  let test_episodes = create_test_episodes()
  let sisko_episodes =
    episode.get_character_episodes(character.benjamin_sisko, test_episodes)
  sisko_episodes
  |> should.equal([
    histogram.SeasonImportance(season: 1, episode: 1, importance: 4),
    histogram.SeasonImportance(season: 1, episode: 2, importance: 0),
  ])
}

pub fn get_organization_episodes_test() {
  let test_episodes = create_test_episodes()
  let federation_episodes =
    episode.get_organization_episodes(
      organization.Federation(role.Starfleet(role.Operations)),
      test_episodes,
    )
  federation_episodes
  |> should.equal([
    histogram.SeasonImportance(season: 1, episode: 1, importance: 4),
    histogram.SeasonImportance(season: 1, episode: 2, importance: 0),
  ])
}
