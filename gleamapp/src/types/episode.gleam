import types/character.{type Character}
import types/organization.{type Organization}

pub type NameAndContrast {
  NameAndContrast(name: String, contrast: Int)
}

pub type CharacterAndContrast {
  CharacterAndContrast(character: Character, contrast: Int)
}

pub type OrganizationAndContrast {
  OrganizationAndContrast(organization: Organization, contrast: Int)
}

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
