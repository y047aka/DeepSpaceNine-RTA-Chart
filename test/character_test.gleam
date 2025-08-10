import gleeunit
import gleeunit/should
import types/character
import types/organization
import types/role
import types/species

pub fn main() {
  gleeunit.main()
}

pub fn character_to_string_test() {
  character.to_string(character.BenjaminSisko)
  |> should.equal("Benjamin Sisko")

  character.to_string(character.Dax)
  |> should.equal("Dax")

  character.to_string(character.KiraNerys)
  |> should.equal("Kira Nerys")
}

pub fn character_from_string_test() {
  character.from_string("Benjamin Sisko")
  |> should.equal(Ok(character.BenjaminSisko))

  character.from_string("Dax")
  |> should.equal(Ok(character.Dax))

  character.from_string("Unknown Character")
  |> should.be_error()
}

pub fn character_image_hue_test() {
  // Federation characters use role-based hue
  character.image_hue(character.BenjaminSisko)
  |> should.equal(350)

  character.image_hue(character.Dax)
  |> should.equal(190)

  // Non-Federation characters use species-based hue
  character.image_hue(character.KiraNerys)
  |> should.equal(10)

  character.image_hue(character.Quark)
  |> should.equal(25)

  character.image_hue(character.Garak)
  |> should.equal(175)

  character.image_hue(character.Gowron)
  |> should.equal(120)
}

// CharacterMetadata tests
pub fn get_metadata_test() {
  let sisko_metadata = character.get_metadata(character.BenjaminSisko)
  sisko_metadata.character |> should.equal(character.BenjaminSisko)
  sisko_metadata.species |> should.equal(species.Human)

  let kira_metadata = character.get_metadata(character.KiraNerys)
  kira_metadata.character |> should.equal(character.KiraNerys)
  kira_metadata.species |> should.equal(species.Bajoran)
}

pub fn get_species_test() {
  character.get_species(character.BenjaminSisko)
  |> should.equal(species.Human)

  character.get_species(character.Dax)
  |> should.equal(species.Trill)

  character.get_species(character.Worf)
  |> should.equal(species.Klingon)
}

pub fn get_role_test() {
  character.get_role(character.BenjaminSisko)
  |> should.equal(role.StarfleetCommand)

  character.get_role(character.Dax)
  |> should.equal(role.StarfleetScience)

  character.get_role(character.MilesObrien)
  |> should.equal(role.StarfleetEngineering)
}

pub fn get_organization_test() {
  character.get_organization(character.BenjaminSisko)
  |> should.equal(organization.Federation(role.StarfleetCommand))

  character.get_organization(character.KiraNerys)
  |> should.equal(organization.BajoranProvisionalGov(role.BajoranMilitia))
}
// Note: Backward compatibility tests have been moved to test/compatibility_test.gleam
// for better test organization as per specification requirements
