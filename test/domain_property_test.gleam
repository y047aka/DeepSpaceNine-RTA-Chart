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

// All characters used in tests
pub fn all_characters() -> List(character.Character) {
  [
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
}

// Property test: All characters should have valid metadata
pub fn all_characters_have_metadata_property() {
  all_characters()
  |> list.each(fn(char) {
    let metadata = character.get_metadata(char)
    metadata.character |> should.equal(char)

    // All metadata should be valid
    let _species = metadata.species
    let _organization = metadata.organization

    // Character accessors should be consistent with metadata
    character.get_species(char) |> should.equal(metadata.species)
    character.get_organization(char) |> should.equal(metadata.organization)
  })
}

// Helper function to validate role-organization combination
fn is_valid_role_organization_combination(
  role: role.Role,
  org: organization.Organization(role.Role),
) -> Bool {
  case org {
    organization.Federation(_) -> {
      case role {
        role.StarfleetCommand
        | role.StarfleetEngineering
        | role.StarfleetSecurity
        | role.StarfleetScience
        | role.StarfleetMedical
        | role.StarfleetOperations -> True
        _ -> False
      }
    }
    organization.BajoranProvisionalGov(_) -> {
      case role {
        role.BajoranMilitia | role.BajoranReligious -> True
        _ -> False
      }
    }
    organization.CardassianUnion -> {
      case role {
        role.CardassianMilitary -> True
        _ -> False
      }
    }
    organization.KlingonEmpire -> {
      case role {
        role.KlingonWarrior -> True
        _ -> False
      }
    }
    organization.FerengiAlliance -> {
      case role {
        role.FerengiCommerce -> True
        _ -> False
      }
    }
    organization.DominionForces(_) -> {
      case role {
        role.VortaDiplomat | role.JemHadarSoldier | role.DominionService -> True
        _ -> False
      }
    }
    organization.BajoranReligion -> {
      case role {
        role.BajoranReligious -> True
        _ -> False
      }
    }
    organization.ProphetsTemple -> {
      case role {
        role.BajoranReligious -> True
        _ -> False
      }
    }
    organization.TrillSymbiosisCommission -> {
      case role {
        role.StarfleetScience -> True
        _ -> False
      }
    }
    organization.Maquis -> {
      case role {
        role.StarfleetSecurity -> True
        _ -> False
      }
    }
    organization.MirrorUniverse -> {
      case role {
        role.StarfleetCommand -> True
        _ -> False
      }
    }
    organization.Independent -> {
      case role {
        role.StarfleetOperations -> True
        _ -> False
      }
    }
  }
}

// Property test: Role-Organization consistency validation
pub fn role_organization_consistency_property() {
  all_characters()
  |> list.each(fn(char) {
    let metadata = character.get_metadata(char)
    let role = character.get_role(char)

    // Validate role-organization combinations are consistent
    let is_valid =
      is_valid_role_organization_combination(role, metadata.organization)
    is_valid |> should.equal(True)
  })
}

// Property test: All characters should have consistent hue calculation
pub fn hue_calculation_consistency_property() {
  all_characters()
  |> list.each(fn(char) {
    let hue = character.image_hue(char)
    let role = character.get_role(char)
    let org = character.get_organization(char)
    let species = character.get_species(char)

    // Hue should be calculated consistently from role/species
    let expected_hue = case org {
      organization.Federation(_) -> role.to_hue(role)
      _ -> species.to_hue(species)
    }

    hue |> should.equal(expected_hue)
  })
}

// Property test: Metadata round-trip consistency
pub fn metadata_roundtrip_property() {
  all_characters()
  |> list.each(fn(char) {
    let original_char = char
    let metadata = character.get_metadata(char)
    let retrieved_char = metadata.character

    original_char |> should.equal(retrieved_char)
  })
}
