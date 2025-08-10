import gleeunit
import gleeunit/should
import types/organization
import types/role

pub fn main() {
  gleeunit.main()
}

pub fn organization_to_string_test() {
  organization.to_string(organization.Federation(role.StarfleetCommand))
  |> should.equal("Federation")

  organization.to_string(organization.Bajor(role.BajoranMilitia))
  |> should.equal("Bajor")

  organization.to_string(organization.MirrorUniverse)
  |> should.equal("Mirror Universe")
}

pub fn organization_from_string_test() {
  organization.from_string("Federation")
  |> should.equal(Ok(organization.Federation(member_role: "")))

  organization.from_string("Bajor")
  |> should.equal(Ok(organization.Bajor(member_role: "")))

  organization.from_string("Unknown Org")
  |> should.be_error()
}

pub fn organization_to_hue_test() {
  organization.to_hue(organization.Federation(role.StarfleetCommand))
  |> should.equal(220)

  organization.to_hue(organization.Bajor(role.BajoranMilitia))
  |> should.equal(10)

  organization.to_hue(organization.DominionForces(role.DominionService))
  |> should.equal(270)
}
