import components/histogram.{type SeasonImportance, SeasonImportance}
import gleam/dynamic/decode
import gleam/json
import gleam/list
import gleam/result
import types/character.{type Character} as char_module
import types/error.{type AppError}
import types/organization.{type Organization}
import types/role

pub type Episode {
  Episode(
    season: Int,
    episode: Int,
    title: String,
    title_ja: String,
    importance: Int,
    netflix_id: Int,
    characters: List(CharacterAndContrast),
    organizations: List(OrganizationAndContrast),
  )
}

pub type CharacterAndContrast {
  CharacterAndContrast(character: Character, contrast: Int)
}

pub type OrganizationAndContrast {
  OrganizationAndContrast(organization: Organization, contrast: Int)
}

pub fn episodes_decoder() -> decode.Decoder(List(Episode)) {
  decode.list(episode_decoder())
}

// Main episode decoder (like Elm's episodeDecoder)
fn episode_decoder() -> decode.Decoder(Episode) {
  use primitive <- decode.then(episode_primitive_decoder())
  decode.success(episode_primitive_to_episode(primitive))
}

// Convert primitive episode to final episode (like Elm's episodeDecoder logic)
fn episode_primitive_to_episode(primitive: EpisodePrimitive) -> Episode {
  let characters =
    primitive.characters
    |> list.filter_map(name_and_contrast_to_character)

  let organizations =
    primitive.organizations
    |> list.filter_map(name_and_contrast_to_organization)

  Episode(
    season: primitive.season,
    episode: primitive.episode,
    title: primitive.title,
    title_ja: primitive.title_ja,
    importance: primitive.importance,
    netflix_id: primitive.netflix_id,
    characters: characters,
    organizations: organizations,
  )
}

// Helper function to convert NameAndContrast to CharacterAndContrast
fn name_and_contrast_to_character(
  nac: NameAndContrast,
) -> Result(CharacterAndContrast, AppError) {
  case char_module.from_string(nac.name) {
    Ok(character) -> Ok(CharacterAndContrast(character, nac.contrast))
    Error(_) -> Error(error.UnknownCharacterError(nac.name))
  }
}

// Helper function to convert NameAndContrast to OrganizationAndContrast
fn name_and_contrast_to_organization(
  nac: NameAndContrast,
) -> Result(OrganizationAndContrast, AppError) {
  // For episode data, we need to handle organizations that may not have specific roles
  // This is a temporary mapping until we have full role information in the episode data
  case nac.name {
    "Federation" ->
      Ok(OrganizationAndContrast(
        organization.Federation(role.Starfleet(role.Operations)),
        nac.contrast,
      ))
    "Bajor" -> Ok(OrganizationAndContrast(organization.Bajor, nac.contrast))
    _ ->
      case organization.from_string(nac.name) {
        Ok(organization) ->
          Ok(OrganizationAndContrast(organization, nac.contrast))
        Error(_) -> Error(error.UnknownOrganizationError(nac.name))
      }
  }
}

// Primitive type for initial JSON decoding (like Elm version)
type EpisodePrimitive {
  EpisodePrimitive(
    season: Int,
    episode: Int,
    title: String,
    title_ja: String,
    importance: Int,
    netflix_id: Int,
    characters: List(NameAndContrast),
    organizations: List(NameAndContrast),
  )
}

pub type NameAndContrast {
  NameAndContrast(name: String, contrast: Int)
}

// Primitive episode decoder (like Elm's primitiveDecoder)
fn episode_primitive_decoder() -> decode.Decoder(EpisodePrimitive) {
  use season <- decode.field("season", decode.int)
  use episode_num <- decode.field("episode", decode.int)
  use title <- decode.field("title", decode.string)
  use title_ja <- decode.field("title_ja", decode.string)
  use importance <- decode.field("importance", decode.int)
  use netflix_id <- decode.field("netflix_id", decode.int)
  use characters <- decode.field(
    "characters",
    decode.list(name_and_contrast_decoder()),
  )
  use organizations <- decode.field(
    "organizations",
    decode.list(name_and_contrast_decoder()),
  )

  decode.success(EpisodePrimitive(
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

// Helper decoder for NameAndContrast (like Elm's nameAndContrastDecoder)
fn name_and_contrast_decoder() -> decode.Decoder(NameAndContrast) {
  use name <- decode.field("name", decode.string)
  use contrast <- decode.field("contrast", decode.int)
  decode.success(NameAndContrast(name, contrast))
}

// Public decoder functions (like json_decoder.gleam functions)

pub fn decode_name_and_contrast(
  json_string: String,
) -> Result(NameAndContrast, json.DecodeError) {
  json.parse(json_string, name_and_contrast_decoder())
}

pub fn decode_episode(json_string: String) -> Result(Episode, json.DecodeError) {
  json.parse(json_string, episode_decoder())
}

// Episode filtering functions (moved from json_decoder.gleam)

pub fn get_character_episodes(
  character: Character,
  episodes: List(Episode),
) -> List(SeasonImportance) {
  episodes
  |> list.map(fn(episode) {
    let contrast =
      episode.characters
      |> list.find(fn(char_contrast) { char_contrast.character == character })
      |> result.map(fn(char_contrast) { char_contrast.contrast })
      |> result.unwrap(0)

    SeasonImportance(
      season: episode.season,
      episode: episode.episode,
      importance: contrast,
    )
  })
}

pub fn get_organization_episodes(
  organization: Organization,
  episodes: List(Episode),
) -> List(SeasonImportance) {
  episodes
  |> list.map(fn(episode) {
    let contrast =
      episode.organizations
      |> list.find(fn(org_contrast) {
        organization.to_string(org_contrast.organization)
        == organization.to_string(organization)
      })
      |> result.map(fn(org_contrast) { org_contrast.contrast })
      |> result.unwrap(0)

    SeasonImportance(
      season: episode.season,
      episode: episode.episode,
      importance: contrast,
    )
  })
}
