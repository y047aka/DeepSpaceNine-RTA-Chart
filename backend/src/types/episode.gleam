import gleam/option.{type Option, Some}

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
    title_ja: Option(String),
    importance: Int,
    netflix_id: Option(Int),
    netflix_synopsis: Option(String),
    url_imdb: Option(String),
    characters: List(Character),
    organizations: List(Organization),
  )
}

/// Sample episode data for testing
pub fn sample_episodes() -> List(Episode) {
  [
    Episode(
      season: 1,
      episode: 1,
      title: "Emissary",
      title_ja: Some("聖なる神殿の謎"),
      importance: 4,
      netflix_id: Some(70_205_806),
      netflix_synopsis: Some("宇宙ステーション..."),
      url_imdb: Some("https://www.imdb.com/title/..."),
      characters: [
        Character("Benjamin Sisko", 4),
        Character("Kira Nerys", 3),
        Character("Odo", 3),
      ],
      organizations: [
        Organization("Federation", 5),
        Organization("Bajoran", 4),
      ],
    ),
    Episode(
      season: 1,
      episode: 2,
      title: "Past Prologue",
      title_ja: Some("過去の序章"),
      importance: 3,
      netflix_id: Some(70_205_807),
      netflix_synopsis: Some("Another episode..."),
      url_imdb: Some("https://www.imdb.com/title/...2"),
      characters: [
        Character("Benjamin Sisko", 4),
        Character("Kira Nerys", 3),
      ],
      organizations: [
        Organization("Federation", 5),
        Organization("Cardassian", 3),
      ],
    ),
  ]
}
