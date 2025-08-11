import components/histogram
import gleeunit
import gleeunit/should
import types/character
import types/episode
import types/organization
import types/role
import types/species

pub fn main() {
  gleeunit.main()
}

pub fn character_and_contrast_test() {
  let char_contrast = episode.CharacterAndContrast(character.BenjaminSisko, 4)
  char_contrast.character |> should.equal(character.BenjaminSisko)
  char_contrast.contrast |> should.equal(4)
}

pub fn organization_and_contrast_test() {
  let org_contrast =
    episode.OrganizationAndContrast(
      organization.Federation(role.Starfleet(role.Operations)),
      3,
    )
  org_contrast.organization
  |> should.equal(organization.Federation(role.Starfleet(role.Operations)))
  org_contrast.contrast |> should.equal(3)
}

pub fn get_character_episodes_test() {
  let test_episodes = [
    episode.Episode(
      season: 1,
      episode: 1,
      title: "Emissary",
      title_ja: "エミサリー",
      importance: 4,
      netflix_id: 1,
      characters: [
        episode.CharacterAndContrast(character.BenjaminSisko, 4),
        episode.CharacterAndContrast(character.KiraNerys, 3),
      ],
      organizations: [
        episode.OrganizationAndContrast(
          organization.Federation(role.Starfleet(role.Operations)),
          4,
        ),
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
        episode.CharacterAndContrast(character.Dax, 2),
      ],
      organizations: [],
    ),
  ]

  let sisko_episodes =
    episode.get_character_episodes(character.BenjaminSisko, test_episodes)
  sisko_episodes
  |> should.equal([
    histogram.SeasonImportance(season: 1, episode: 1, importance: 4),
    histogram.SeasonImportance(season: 1, episode: 2, importance: 0),
  ])
}

pub fn get_organization_episodes_test() {
  let test_episodes = [
    episode.Episode(
      season: 1,
      episode: 1,
      title: "Emissary",
      title_ja: "エミサリー",
      importance: 4,
      netflix_id: 1,
      characters: [
        episode.CharacterAndContrast(character.BenjaminSisko, 4),
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
      characters: [],
      organizations: [
        episode.OrganizationAndContrast(organization.DominionForces, 2),
      ],
    ),
  ]

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

pub fn new_metadata_compatibility_test() {
  // Test that new character metadata functions work with existing episode structure
  let sisko_metadata = character.get_metadata(character.BenjaminSisko)
  sisko_metadata.character |> should.equal(character.BenjaminSisko)

  // Test that new functions return expected values
  character.get_species(character.BenjaminSisko)
  |> should.equal(species.Human)
}

// Test organization matching with new role system
pub fn organization_role_matching_test() {
  // Test that organizations with specific roles match correctly
  let federation_ops = organization.Federation(role.Starfleet(role.Operations))
  let federation_cmd = organization.Federation(role.Starfleet(role.Command))

  // Different roles should be different organizations for comparison purposes
  federation_ops |> should.not_equal(federation_cmd)

  // But same roles should match
  let federation_ops2 = organization.Federation(role.Starfleet(role.Operations))
  federation_ops |> should.equal(federation_ops2)
}

// Test default role assignment from strings
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
