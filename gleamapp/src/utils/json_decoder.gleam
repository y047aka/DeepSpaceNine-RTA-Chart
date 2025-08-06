import components/histogram.{type SeasonImportance, SeasonImportance}
import gleam/dynamic/decode
import gleam/json
import gleam/list
import gleam/result
import types/character.{type Character, BenjaminSisko}
import types/character as char_module
import types/episode.{type Episode, Episode, NameAndContrast}
import types/organization.{type Organization, Federation}
import types/organization as org_module

// Helper decoders for nested structures
fn decode_character_and_contrast() -> decode.Decoder(
  episode.CharacterAndContrast,
) {
  use character_name <- decode.field("name", decode.string)
  use contrast <- decode.field("contrast", decode.int)
  case character_from_string(character_name) {
    Ok(character) ->
      decode.success(episode.CharacterAndContrast(character, contrast))
    Error(_) ->
      decode.failure(
        episode.CharacterAndContrast(BenjaminSisko, 0),
        "Character",
      )
  }
}

fn decode_organization_and_contrast() -> decode.Decoder(
  episode.OrganizationAndContrast,
) {
  use org_name <- decode.field("name", decode.string)
  use contrast <- decode.field("contrast", decode.int)
  case organization_from_string(org_name) {
    Ok(organization) ->
      decode.success(episode.OrganizationAndContrast(organization, contrast))
    Error(_) ->
      decode.failure(
        episode.OrganizationAndContrast(Federation, 0),
        "Organization",
      )
  }
}

fn decode_episode_from_json() -> decode.Decoder(Episode) {
  use season <- decode.field("season", decode.int)
  use episode_num <- decode.field("episode", decode.int)
  use title <- decode.field("title", decode.string)
  use title_ja <- decode.field("title_ja", decode.string)
  use importance <- decode.field("importance", decode.int)
  use netflix_id <- decode.field("netflix_id", decode.int)
  use characters <- decode.field(
    "characters",
    decode.list(decode_character_and_contrast()),
  )
  use organizations <- decode.field(
    "organizations",
    decode.list(decode_organization_and_contrast()),
  )

  decode.success(Episode(
    season: season,
    episode: episode_num,
    title: title,
    title_ja: title_ja,
    importance: importance,
    netflix_id: netflix_id,
    characters: characters,
    organizations: organizations,
  ))
}

// Public decoder functions using gleam_json v3 API

pub fn decode_name_and_contrast(
  json_string: String,
) -> Result(episode.NameAndContrast, json.DecodeError) {
  let decoder = {
    use name <- decode.field("name", decode.string)
    use contrast <- decode.field("contrast", decode.int)
    decode.success(NameAndContrast(name, contrast))
  }
  json.parse(json_string, decoder)
}

pub fn decode_episode(json_string: String) -> Result(Episode, json.DecodeError) {
  json.parse(json_string, decode_episode_from_json())
}

pub fn decode_episodes_from_js() -> Result(List(Episode), json.DecodeError) {
  // TODO: Load actual episodes.js file content
  let episodes_json =
    "[{\"season\":1,\"episode\":1,\"title\":\"Emissary\",\"title_ja\":\"聖なる神殿の謎\",\"importance\":4,\"netflix_id\":70205806,\"characters\":[{\"name\":\"Benjamin Sisko\",\"contrast\":4},{\"name\":\"Dax\",\"contrast\":4}],\"organizations\":[{\"name\":\"Federation\",\"contrast\":5},{\"name\":\"Bajor\",\"contrast\":5}]}]"

  json.parse(episodes_json, decode.list(decode_episode_from_json()))
}

pub fn character_to_string(character: Character) -> String {
  char_module.to_string(character)
}

pub fn character_from_string(name: String) -> Result(Character, Nil) {
  char_module.from_string(name) |> result.map_error(fn(_) { Nil })
}

pub fn organization_to_string(organization: Organization) -> String {
  org_module.to_string(organization)
}

pub fn organization_from_string(name: String) -> Result(Organization, Nil) {
  org_module.from_string(name) |> result.map_error(fn(_) { Nil })
}

// TDD Red Phase: These functions will initially be stubs to make tests fail
// TODO: Implement proper filtering logic

pub fn get_character_episodes(
  character: Character,
  episodes: List(Episode),
) -> List(SeasonImportance) {
  // TDD Green Phase: Implement character filtering logic
  episodes
  |> list.map(fn(episode) {
    // Find the character in this episode
    let contrast =
      episode.characters
      |> list.find(fn(char_contrast) { char_contrast.character == character })
      |> result.map(fn(char_contrast) { char_contrast.contrast })
      |> result.unwrap(0)
    // Default to 0 if character not found

    SeasonImportance(season: episode.season, importance: contrast)
  })
}

pub fn get_organization_episodes(
  organization: Organization,
  episodes: List(Episode),
) -> List(SeasonImportance) {
  // TDD Green Phase: Implement organization filtering logic
  episodes
  |> list.map(fn(episode) {
    // Find the organization in this episode
    let contrast =
      episode.organizations
      |> list.find(fn(org_contrast) {
        org_contrast.organization == organization
      })
      |> result.map(fn(org_contrast) { org_contrast.contrast })
      |> result.unwrap(0)
    // Default to 0 if organization not found

    SeasonImportance(season: episode.season, importance: contrast)
  })
}

pub fn should_show_character(
  _character: Character,
  _after_season_4: Bool,
) -> Bool {
  // TDD Green Phase: Basic implementation - for now show all characters
  // TODO: Implement actual season-4 based filtering logic
  True
}
