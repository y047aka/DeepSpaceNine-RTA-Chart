import gleam/json

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

pub fn episodes_to_json(episodes: List(Episode)) -> String {
  json.to_string(
    json.object([
      #("episodes", json.array(episodes, episode_to_json)),
    ]),
  )
}

pub fn episode_to_json(episode: Episode) -> json.Json {
  json.object([
    #("season", json.int(episode.season)),
    #("episode", json.int(episode.episode)),
    #("title", json.string(episode.title)),
    #("title_ja", json.string(episode.title_ja)),
    #("importance", json.int(episode.importance)),
    #("netflix_id", json.int(episode.netflix_id)),
    #("netflix_synopsis", json.string(episode.netflix_synopsis)),
    #("url_imdb", json.string(episode.url_imdb)),
    #("characters", json.array(episode.characters, character_to_json)),
    #("organizations", json.array(episode.organizations, organization_to_json)),
  ])
}

fn character_to_json(character: Character) -> json.Json {
  json.object([
    #("name", json.string(character.name)),
    #("contrast", json.int(character.contrast)),
  ])
}

fn organization_to_json(organization: Organization) -> json.Json {
  json.object([
    #("name", json.string(organization.name)),
    #("contrast", json.int(organization.contrast)),
  ])
}

pub fn test_episodes() -> List(Episode) {
  [
    Episode(
      season: 1,
      episode: 1,
      title: "Test Episode One",
      title_ja: "テストエピソード1",
      importance: 3,
      netflix_id: 123_456_789,
      netflix_synopsis: "テスト用のエピソード概要です。",
      url_imdb: "https://www.imdb.com/title/tt1234567/",
      characters: [
        Character("Test Character 1", 4),
        Character("Test Character 2", 3),
      ],
      organizations: [
        Organization("Test Organization", 3),
      ],
    ),
    Episode(
      season: 1,
      episode: 2,
      title: "Test Episode Two",
      title_ja: "テストエピソード2",
      importance: 2,
      netflix_id: 987_654_321,
      netflix_synopsis: "2番目のテストエピソードです。",
      url_imdb: "https://www.imdb.com/title/tt7654321/",
      characters: [
        Character("Test Character 3", 2),
      ],
      organizations: [
        Organization("Another Test Org", 2),
      ],
    ),
  ]
}
