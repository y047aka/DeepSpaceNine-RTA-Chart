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