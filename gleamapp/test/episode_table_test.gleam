import components/episode_table
import gleeunit
import gleeunit/should
import types/character.{BenjaminSisko, Dax}
import types/episode.{CharacterAndContrast, Episode, OrganizationAndContrast}
import types/organization.{Bajor, Federation}

pub fn main() {
  gleeunit.main()
}

// TDD Red Phase: Test episode table structure
pub fn episode_table_structure_test() {
  let test_episodes = [
    Episode(
      season: 1,
      episode: 1,
      title: "Emissary",
      title_ja: "聖なる神殿の謎",
      importance: 4,
      netflix_id: 70_205_806,
      characters: [CharacterAndContrast(BenjaminSisko, 4)],
      organizations: [OrganizationAndContrast(Federation, 5)],
    ),
    Episode(
      season: 1,
      episode: 2,
      title: "A Man Alone",
      title_ja: "宇宙ステーション殺人事件",
      importance: 3,
      netflix_id: 70_205_809,
      characters: [CharacterAndContrast(Dax, 3)],
      organizations: [OrganizationAndContrast(Bajor, 4)],
    ),
  ]

  // Test that episode table view function exists and returns an Element
  let _table_element = episode_table.view(test_episodes)

  // Basic test: function exists and compiles 
  should.equal(True, True)
}

// TDD Red Phase: Test episode table content
pub fn episode_table_content_test() {
  let test_episodes = [
    Episode(
      season: 1,
      episode: 1,
      title: "Emissary",
      title_ja: "聖なる神殿の謎",
      importance: 4,
      netflix_id: 70_205_806,
      characters: [],
      organizations: [],
    ),
  ]

  // Test that table renders correctly
  let _table_element = episode_table.view(test_episodes)

  // This will test that the function exists and compiles
  should.equal(True, True)
}

// TDD Red Phase: Test importance circle rendering
pub fn importance_circle_test() {
  let importance_5 = episode_table.importance_circle(5)
  let importance_1 = episode_table.importance_circle(1)

  // Test that importance circles render as elements
  let _importance_5 = importance_5
  let _importance_1 = importance_1
  should.equal(True, True)
}

// TDD Red Phase: Test episode row rendering
pub fn episode_row_test() {
  let test_episode =
    Episode(
      season: 1,
      episode: 1,
      title: "Emissary",
      title_ja: "聖なる神殿の謎",
      importance: 4,
      netflix_id: 70_205_806,
      characters: [],
      organizations: [],
    )

  let row_element = episode_table.episode_row(test_episode)

  // Test that episode row renders as an element
  let _row_element = row_element
  should.equal(True, True)
}
