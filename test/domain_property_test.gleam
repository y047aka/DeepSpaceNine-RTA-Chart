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
  let all_characters = [
    character.BenjaminSisko,
    character.JakeSisko,
    character.Dax,
    character.KiraNerys,
    character.MilesObrien,
    character.KeikoObrien,
    character.Bashir,
    character.Odo,
    character.Worf,
    character.Quark,
    character.Rom,
    character.Nog,
    character.Winn,
    character.Bareil,
    character.Garak,
    character.Dukat,
    character.Zek,
    character.MichaelEddington,
    character.KasidyYates,
    character.Leeta,
    character.Gowron,
    character.Martok,
    character.Shakaar,
    character.Ziyal,
    character.Damar,
    character.Brunt,
    character.Weyoun,
  ]

  // Test that every character has metadata
  all_characters
  |> list.each(fn(char) {
    let metadata = character.get_metadata(char)
    metadata.character |> should.equal(char)
  })
}

// Test role system consistency
pub fn role_system_consistency_test() {
  // Test Starfleet role round-trip consistency
  let starfleet_roles = [
    role.Command,
    role.Security,
    role.Science,
    role.Medical,
    role.Operations,
  ]

  starfleet_roles
  |> list.each(fn(role) {
    role
    |> role.starfleet_role_to_string()
    |> role.starfleet_role_from_string()
    |> should.equal(Ok(role))
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
  // Federation characters should use role-based hues
  let federation_characters = [
    character.BenjaminSisko,
    character.Dax,
    character.MilesObrien,
    character.Bashir,
    character.Odo,
    character.Worf,
    character.MichaelEddington,
  ]

  federation_characters
  |> list.each(fn(char) {
    let hue = character.image_hue(char)
    let metadata = character.get_metadata(char)

    case metadata.organization {
      organization.Federation(federation_role) -> {
        let expected_hue = role.federation_role_to_hue(federation_role)
        hue |> should.equal(expected_hue)
      }
      _ -> should.fail()
      // Should be Federation
    }
  })

  // Non-Federation characters should use species-based hues
  let non_federation_characters = [
    character.Quark,
    character.KiraNerys,
    character.Garak,
    character.Gowron,
  ]

  non_federation_characters
  |> list.each(fn(char) {
    let hue = character.image_hue(char)
    let metadata = character.get_metadata(char)
    let expected_hue = species.to_hue(metadata.species)
    hue |> should.equal(expected_hue)
  })
}

// Test that all character organizations are properly structured
pub fn character_organization_structure_test() {
  let all_characters = [
    character.BenjaminSisko,
    character.JakeSisko,
    character.Dax,
    character.KiraNerys,
    character.MilesObrien,
    character.KeikoObrien,
    character.Bashir,
    character.Odo,
    character.Worf,
    character.Quark,
    character.Rom,
    character.Nog,
    character.Winn,
    character.Bareil,
    character.Garak,
    character.Dukat,
    character.Zek,
    character.MichaelEddington,
    character.KasidyYates,
    character.Leeta,
    character.Gowron,
    character.Martok,
    character.Shakaar,
    character.Ziyal,
    character.Damar,
    character.Brunt,
    character.Weyoun,
  ]

  // Test that each character has a properly structured organization
  all_characters
  |> list.each(fn(char) {
    let metadata = character.get_metadata(char)

    // Verify organization structure based on type
    case metadata.organization {
      organization.Federation(federation_role) -> {
        // Should be a valid Federation role
        let _ = role.federation_role_to_string(federation_role)
        should.equal(True, True)
        // Compilation success
      }
      organization.Bajor -> {
        // Bajor organization without roles
        should.equal(True, True)
        // Compilation success
      }
      organization.CardassianUnion
      | organization.KlingonEmpire
      | organization.DominionForces
      | organization.FerengiAlliance
      | organization.Prophets
      | organization.TrillSymbiosisCommission
      | organization.Maquis
      | organization.MirrorUniverse
      | organization.Independent
      | organization.Citizen -> {
        // Organizations without roles - should work
        should.equal(True, True)
      }
    }
  })
}
