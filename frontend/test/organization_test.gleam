import gleeunit
import gleeunit/should
import types/organization
import types/role

pub fn main() {
  gleeunit.main()
}

pub fn organization_to_string_test() {
  organization.to_string(organization.Federation(role.Starfleet(role.Command)))
  |> should.equal("Federation")

  organization.to_string(organization.Bajor)
  |> should.equal("Bajor")

  organization.to_string(organization.MirrorUniverse)
  |> should.equal("Mirror Universe")
}

pub fn organization_from_string_test() {
  organization.from_string("Federation")
  |> should.equal(Ok(organization.Federation(role.Citizen)))

  organization.from_string("Bajor")
  |> should.equal(Ok(organization.Bajor))

  organization.from_string("Unknown Org")
  |> should.be_error()
}

pub fn organization_to_hue_var_test() {
  organization.to_hue_var(organization.Federation(role.Starfleet(role.Command)))
  |> should.equal("var(--hue-federation)")

  organization.to_hue_var(organization.Bajor)
  |> should.equal("var(--hue-bajoran)")

  organization.to_hue_var(organization.DominionForces)
  |> should.equal("var(--hue-dominion)")
}
