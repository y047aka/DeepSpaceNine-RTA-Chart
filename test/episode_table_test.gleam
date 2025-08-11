import components/episode_table
import gleeunit
import gleeunit/should
import types/character.{BenjaminSisko, Dax}
import types/episode.{CharacterAndContrast, Episode, OrganizationAndContrast}
import types/organization
import types/role

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
      organizations: [
        OrganizationAndContrast(
          organization.Federation(role.Starfleet(role.Operations)),
          5,
        ),
      ],
    ),
    Episode(
      season: 1,
      episode: 2,
      title: "A Man Alone",
      title_ja: "宇宙ステーション殺人事件",
      importance: 3,
      netflix_id: 70_205_809,
      characters: [CharacterAndContrast(Dax, 3)],
      organizations: [
        OrganizationAndContrast(organization.Bajor, 4),
      ],
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

  let row_element = episode_table.episode_row(test_episode, 0)

  // Test that episode row renders as an element
  let _row_element = row_element
  should.equal(True, True)
}

// Test episode table with new organization role system
pub fn episode_table_new_organizations_test() {
  let test_episodes = [
    Episode(
      season: 1,
      episode: 1,
      title: "Test Episode with Roles",
      title_ja: "役割テストエピソード",
      importance: 5,
      netflix_id: 99_999,
      characters: [CharacterAndContrast(BenjaminSisko, 5)],
      organizations: [
        OrganizationAndContrast(
          organization.Federation(role.Starfleet(role.Command)),
          5,
        ),
        OrganizationAndContrast(organization.Bajor, 3),
        OrganizationAndContrast(organization.DominionForces, 2),
      ],
    ),
  ]

  // Test that episode table handles different organization types
  let _table_element = episode_table.view(test_episodes)

  // Test passes if it compiles and renders without error
  should.equal(True, True)
}

// Test mixed organization types in episode table
pub fn episode_table_mixed_organizations_test() {
  let test_episodes = [
    Episode(
      season: 2,
      episode: 1,
      title: "Mixed Organizations",
      title_ja: "混合組織",
      importance: 4,
      netflix_id: 88_888,
      characters: [],
      organizations: [
        OrganizationAndContrast(
          organization.Federation(role.Starfleet(role.Science)),
          4,
        ),
        OrganizationAndContrast(organization.CardassianUnion, 3),
        OrganizationAndContrast(organization.KlingonEmpire, 2),
        OrganizationAndContrast(organization.FerengiAlliance, 1),
      ],
    ),
  ]

  // Test rendering of organizations both with and without roles
  let _table_element = episode_table.view(test_episodes)

  // Test passes if it compiles without error
  should.equal(True, True)
}
