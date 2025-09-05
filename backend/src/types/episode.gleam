/// Character appearing in an episode
pub type Character {
  Character(name: String, contrast: Int)
}

/// Organization appearing in an episode
pub type Organization {
  Organization(name: String, contrast: Int)
}

/// Episode data structure
pub type Episode {
  Episode(
    season: Int,
    episode: Int,
    title: String,
    title_ja: String,
    importance: Int,
    netflix_id: Int,
    netflix_synopsis: String,
    url_imdb: String,
    characters: List(Character),
    organizations: List(Organization),
  )
}
