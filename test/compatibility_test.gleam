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

// Public API consistency tests
pub fn public_api_consistency_test() {
  // Character to_string consistency
  character.to_string(character.BenjaminSisko)
  |> should.equal("Benjamin Sisko")

  character.to_string(character.KiraNerys)
  |> should.equal("Kira Nerys")

  // Character from_string consistency
  character.from_string("Benjamin Sisko")
  |> should.equal(Ok(character.BenjaminSisko))

  character.from_string("Kira Nerys")
  |> should.equal(Ok(character.KiraNerys))

  // Organization to_string consistency with new roles
  organization.to_string(organization.Federation(role.Starfleet(role.Command)))
  |> should.equal("Federation")

  organization.to_string(organization.Bajor)
  |> should.equal("Bajor")
}

// Test backward compatibility with default roles
pub fn backward_compatible_organization_parsing_test() {
  // Organization from_string now returns default roles
  organization.from_string("Federation")
  |> should.equal(Ok(organization.Federation(role.Citizen)))

  organization.from_string("Bajor")
  |> should.equal(Ok(organization.Bajor))

  // Organizations without roles remain unchanged
  organization.from_string("Cardassian Union")
  |> should.equal(Ok(organization.CardassianUnion))

  organization.from_string("Dominion")
  |> should.equal(Ok(organization.DominionForces))
}

// Test color consistency with new role system
pub fn backward_compatible_hue_test() {
  // Test that image_hue function produces expected results
  // with the new role-based system
  let sisko_hue = character.image_hue(character.BenjaminSisko)
  sisko_hue |> should.equal(350)
  // Command role

  let dax_hue = character.image_hue(character.Dax)
  dax_hue |> should.equal(190)
  // Science role

  // Non-Federation characters use species-based hue
  let kira_hue = character.image_hue(character.KiraNerys)
  kira_hue |> should.equal(10)
  // Bajoran species (not role-based)

  let quark_hue = character.image_hue(character.Quark)
  quark_hue |> should.equal(25)
  // Ferengi species

  let odo_hue = character.image_hue(character.Odo)
  odo_hue |> should.equal(55)
  // Security role (Federation)
}

// Test organization hue consistency
pub fn organization_hue_consistency_test() {
  // Federation organizations return Federation base hue
  organization.to_hue(organization.Federation(role.Starfleet(role.Command)))
  |> should.equal(220)
  // Federation base color

  organization.to_hue(organization.Federation(role.Starfleet(role.Science)))
  |> should.equal(220)
  // Federation base color

  // Bajor organizations return Bajoran hue
  organization.to_hue(organization.Bajor)
  |> should.equal(10)
  // Bajoran color

  // Organizations without roles
  organization.to_hue(organization.CardassianUnion)
  |> should.equal(175)
  // Cardassian color

  organization.to_hue(organization.DominionForces)
  |> should.equal(270)
  // Dominion color
}

// Test episode data processing compatibility
pub fn episode_data_compatibility_test() {
  // Test that episodes can be created with new organization system
  let test_episode =
    episode.Episode(
      season: 1,
      episode: 1,
      title: "Test Compatibility",
      title_ja: "互換性テスト",
      importance: 5,
      netflix_id: 99_999,
      characters: [
        episode.CharacterAndContrast(character.BenjaminSisko, 5),
        episode.CharacterAndContrast(character.KiraNerys, 4),
      ],
      organizations: [
        episode.OrganizationAndContrast(
          organization.Federation(role.Citizen),
          5,
        ),
        episode.OrganizationAndContrast(organization.Bajor, 4),
        episode.OrganizationAndContrast(organization.CardassianUnion, 2),
      ],
    )

  // Verify episode data integrity
  test_episode.season |> should.equal(1)
  test_episode.characters |> list.length() |> should.equal(2)
  test_episode.organizations |> list.length() |> should.equal(3)
}

// Test character metadata system compatibility
pub fn character_metadata_compatibility_test() {
  // Test that all characters have valid metadata
  let sisko_metadata = character.get_metadata(character.BenjaminSisko)
  sisko_metadata.character |> should.equal(character.BenjaminSisko)

  let kira_metadata = character.get_metadata(character.KiraNerys)
  kira_metadata.character |> should.equal(character.KiraNerys)

  // Test organization assignments
  case sisko_metadata.organization {
    organization.Federation(role) ->
      role |> should.equal(role.Starfleet(role.Command))
    _ -> should.fail()
  }

  case kira_metadata.organization {
    organization.Bajor -> should.equal(True, True)
    _ -> should.fail()
  }
}

// Test role specialization system
pub fn role_specialization_consistency_test() {
  // Test Starfleet role functions
  role.starfleet_role_to_string(role.Command)
  |> should.equal("Starfleet Command")

  role.starfleet_role_to_hue(role.Command)
  |> should.equal(350)

  // Test role parsing
  role.starfleet_role_from_string("starfleet command")
  |> should.equal(Ok(role.Command))
}

// Test new type system prevents invalid combinations
pub fn type_safety_validation_test() {
  // These should compile successfully (valid combinations)
  let _valid_federation = organization.Federation(role.Starfleet(role.Security))
  let _valid_bajor = organization.Bajor

  // Organizations without roles
  let _valid_cardassian = organization.CardassianUnion
  let _valid_dominion = organization.DominionForces

  // Test that role-specific functions work correctly
  role.starfleet_role_to_hue(role.Science)
  |> should.equal(190)

  // This test passes if it compiles (type safety enforced at compile time)
  should.equal(True, True)
}
