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
  character.image_hue(character.BenjaminSisko)
  |> should.equal(350)

  character.image_hue(character.Dax)
  |> should.equal(190)

  character.image_hue(character.KiraNerys)
  |> should.equal(10)
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
  |> should.equal(organization.GenericFederation(role.StarfleetCommand))

  character.get_organization(character.KiraNerys)
  |> should.equal(organization.BajoranProvisionalGov(role.BajoranMilitia))
}

// Backward compatibility tests
pub fn legacy_organization_mapping_test() {
  character.legacy_organization_mapping("Federation")
  |> should.equal(Ok(organization.GenericFederation(role.StarfleetOperations)))

  character.legacy_organization_mapping("Bajor")
  |> should.equal(Ok(organization.BajoranProvisionalGov(role.BajoranMilitia)))

  character.legacy_organization_mapping("Cardassia")
  |> should.equal(Ok(organization.CardassianUnion))
}

pub fn legacy_species_from_organization_test() {
  character.legacy_species_from_organization("Trill")
  |> should.equal(Ok(species.Trill))

  character.legacy_species_from_organization("Bajor")
  |> should.equal(Ok(species.Bajoran))

  character.legacy_species_from_organization("Ferengi")
  |> should.equal(Ok(species.Ferengi))
}

pub fn backward_compatible_hue_test() {
  // Test that image_hue function still produces valid results
  // even with the new metadata system
  let sisko_hue = character.image_hue(character.BenjaminSisko)
  sisko_hue |> should.equal(350)
  // Command role

  let dax_hue = character.image_hue(character.Dax)
  dax_hue |> should.equal(190)
  // Science role

  let quark_hue = character.image_hue(character.Quark)
  quark_hue |> should.equal(25)
  // Ferengi Alliance
}
