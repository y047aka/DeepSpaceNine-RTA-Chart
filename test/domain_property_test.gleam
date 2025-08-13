import gleam/list
import gleeunit
import gleeunit/should
import types/character
import types/organization
import types/role
import types/species

pub fn main() {
  gleeunit.main()
}

// Test domain model consistency properties
pub fn character_metadata_consistency_test() {
  // Test that all characters have valid metadata
  character.list_all_characters()
  |> list.each(fn(character) {
    character.get_character_by_name(character.name) |> should.be_ok()
  })
}

// Test hue consistency properties
pub fn hue_consistency_test() {
  // Test that role hues are within valid range (0-360)
  let starfleet_roles = [
    role.Command,
    role.Security,
    role.Science,
    role.Medical,
    role.Operations,
  ]

  starfleet_roles
  |> list.each(fn(role) {
    let hue = role.starfleet_role_to_hue(role)
    // Hue should be in valid range (0-360)
    case hue >= 0 && hue <= 360 {
      True -> should.equal(True, True)
      False -> should.fail()
    }
  })
}

// Test species hue consistency
pub fn species_hue_consistency_test() {
  let all_species = [
    species.Human,
    species.Bajoran,
    species.Cardassian,
    species.Klingon,
    species.Ferengi,
    species.Trill,
    species.Changeling,
    species.Vorta,
    species.JemHadar,
    species.Vulcan,
    species.Andorian,
    species.Betazoid,
    species.ElAurian,
  ]

  all_species
  |> list.each(fn(spec) {
    let hue = species.to_hue(spec)
    // Hue should be in valid range (0-360)
    case hue >= 0 && hue <= 360 {
      True -> should.equal(True, True)
      False -> should.fail()
    }
  })
}

// Test character image hue calculation consistency
pub fn character_image_hue_consistency_test() {
  // Test all characters from the complete list
  character.list_all_characters()
  |> list.each(fn(char_data) {
    let hue = character.character_hue(char_data)

    case char_data.organization {
      organization.Federation(federation_role) -> {
        let expected_hue = role.federation_role_to_hue(federation_role)
        hue |> should.equal(expected_hue)
      }
      _ -> {
        // Non-Federation characters should use species-based hues
        let expected_hue = species.to_hue(char_data.species)
        hue |> should.equal(expected_hue)
      }
    }
  })
}
