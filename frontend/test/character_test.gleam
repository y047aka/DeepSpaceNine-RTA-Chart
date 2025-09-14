import gleeunit
import gleeunit/should
import types/character
import types/organization
import types/role
import types/species

pub fn main() {
  gleeunit.main()
}

pub fn get_character_data_test() {
  character.benjamin_sisko.name
  |> should.equal("Benjamin Sisko")
  character.dax.name
  |> should.equal("Dax")

  character.kira_nerys.name
  |> should.equal("Kira Nerys")
}

pub fn character_by_name_test() {
  // Test successful parsing with Character directly
  case character.get_character_by_name("Benjamin Sisko") {
    Ok(character) -> {
      character.name |> should.equal("Benjamin Sisko")
      character.species |> should.equal(species.Human)
    }
    Error(_) -> should.fail()
  }

  case character.get_character_by_name("Dax") {
    Ok(character) -> {
      character.name |> should.equal("Dax")
      character.species |> should.equal(species.Trill)
    }
    Error(_) -> should.fail()
  }

  character.get_character_by_name("Unknown Character")
  |> should.be_error()
}

pub fn character_image_hue_var_test() {
  // Federation characters use role-based hue
  character.character_hue_var(character.benjamin_sisko)
  |> should.equal("var(--hue-starfleet-command)")

  character.character_hue_var(character.dax)
  |> should.equal("var(--hue-starfleet-science-or-medical)")

  // Non-Federation characters use species-based hue
  character.character_hue_var(character.kira_nerys)
  |> should.equal("var(--hue-bajoran)")

  character.character_hue_var(character.quark)
  |> should.equal("var(--hue-ferengi)")

  character.character_hue_var(character.garak)
  |> should.equal("var(--hue-cardassian)")

  character.character_hue_var(character.gowron)
  |> should.equal("var(--hue-klingon)")
}

// New API tests
pub fn get_character_by_name_test() {
  character.get_character_by_name("Benjamin Sisko")
  |> should.be_ok()

  let sisko_data = character.get_character_by_name("Benjamin Sisko")
  case sisko_data {
    Ok(data) -> {
      data.name |> should.equal("Benjamin Sisko")
      data.species |> should.equal(species.Human)
    }
    Error(_) -> should.fail()
  }

  let kira_data = character.get_character_by_name("Kira Nerys")
  case kira_data {
    Ok(data) -> {
      data.name |> should.equal("Kira Nerys")
      data.species |> should.equal(species.Bajoran)
    }
    Error(_) -> should.fail()
  }
}

pub fn get_species_test() {
  character.benjamin_sisko.species
  |> should.equal(species.Human)

  character.dax.species
  |> should.equal(species.Trill)

  character.worf.species
  |> should.equal(species.Klingon)
}

pub fn get_organization_test() {
  character.benjamin_sisko.organization
  |> should.equal(organization.Federation(role.Starfleet(role.Command)))

  character.kira_nerys.organization
  |> should.equal(organization.Bajor)
}
