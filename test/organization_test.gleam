import gleeunit
import gleeunit/should
import types/organization

pub fn main() {
  gleeunit.main()
}

pub fn organization_to_string_test() {
  organization.to_string(organization.Federation)
  |> should.equal("Federation")

  organization.to_string(organization.Bajor)
  |> should.equal("Bajor")

  organization.to_string(organization.MirrorUniverse)
  |> should.equal("Mirror Universe")
}

pub fn organization_from_string_test() {
  organization.from_string("Federation")
  |> should.equal(Ok(organization.Federation))

  organization.from_string("Bajor")
  |> should.equal(Ok(organization.Bajor))

  organization.from_string("Unknown Org")
  |> should.be_error()
}

pub fn organization_image_hue_test() {
  organization.image_hue(organization.Federation)
  |> should.equal(220)

  organization.image_hue(organization.Bajor)
  |> should.equal(10)

  organization.image_hue(organization.Dominion)
  |> should.equal(270)
}

// Generic Organization tests
pub fn generic_organization_to_string_test() {
  organization.generic_to_string(organization.GenericFederation("Command"))
  |> should.equal("Federation")

  organization.generic_to_string(organization.CardassianUnion)
  |> should.equal("Cardassian Union")

  organization.generic_to_string(organization.BajoranReligion)
  |> should.equal("Bajoran Religion")
}

pub fn generic_organization_from_string_test() {
  organization.generic_from_string("Federation")
  |> should.equal(Ok(organization.GenericFederation(member_role: "")))

  organization.generic_from_string("Cardassian Union")
  |> should.equal(Ok(organization.CardassianUnion))

  organization.generic_from_string("Unknown Org")
  |> should.be_error()
}

pub fn generic_organization_hue_test() {
  organization.generic_to_hue(organization.GenericFederation("Command"))
  |> should.equal(220)

  organization.generic_to_hue(organization.CardassianUnion)
  |> should.equal(175)

  organization.generic_to_hue(organization.KlingonEmpire)
  |> should.equal(120)

  organization.generic_to_hue(organization.DominionForces("Soldier"))
  |> should.equal(270)
}
