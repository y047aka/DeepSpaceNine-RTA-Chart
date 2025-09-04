import gleeunit
import gleeunit/should
import types/role

pub fn main() {
  gleeunit.main()
}

// Role Construction Tests ------------------------------------------------------------------------

pub fn role_construction_test() {
  // Test Federation roles can be constructed
  let _command_role = role.Starfleet(role.Command)
  let _citizen_role = role.Citizen
  should.equal(True, True)
}

// Role Hue Tests ------------------------------------------------------------------------

pub fn starfleet_role_hue_test() {
  role.starfleet_role_to_hue(role.Command)
  |> should.equal(350)

  role.starfleet_role_to_hue(role.Security)
  |> should.equal(55)

  role.starfleet_role_to_hue(role.Science)
  |> should.equal(190)

  role.starfleet_role_to_hue(role.Medical)
  |> should.equal(190)

  role.starfleet_role_to_hue(role.Operations)
  |> should.equal(55)
}

pub fn federation_role_hue_test() {
  role.federation_role_to_hue(role.Starfleet(role.Command))
  |> should.equal(350)

  role.federation_role_to_hue(role.Starfleet(role.Security))
  |> should.equal(55)

  role.federation_role_to_hue(role.Starfleet(role.Science))
  |> should.equal(190)

  role.federation_role_to_hue(role.Starfleet(role.Medical))
  |> should.equal(190)

  role.federation_role_to_hue(role.Starfleet(role.Operations))
  |> should.equal(55)

  role.federation_role_to_hue(role.Citizen)
  |> should.equal(220)
}
