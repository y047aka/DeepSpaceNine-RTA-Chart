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

pub fn starfleet_role_hue_var_test() {
  role.starfleet_role_to_hue_var(role.Command)
  |> should.equal("var(--hue-starfleet-command)")

  role.starfleet_role_to_hue_var(role.Security)
  |> should.equal("var(--hue-starfleet-operations-or-security)")

  role.starfleet_role_to_hue_var(role.Science)
  |> should.equal("var(--hue-starfleet-science-or-medical)")

  role.starfleet_role_to_hue_var(role.Medical)
  |> should.equal("var(--hue-starfleet-science-or-medical)")

  role.starfleet_role_to_hue_var(role.Operations)
  |> should.equal("var(--hue-starfleet-operations-or-security)")
}

pub fn federation_role_hue_var_test() {
  role.federation_role_to_hue_var(role.Starfleet(role.Command))
  |> should.equal("var(--hue-starfleet-command)")

  role.federation_role_to_hue_var(role.Starfleet(role.Security))
  |> should.equal("var(--hue-starfleet-operations-or-security)")

  role.federation_role_to_hue_var(role.Starfleet(role.Science))
  |> should.equal("var(--hue-starfleet-science-or-medical)")

  role.federation_role_to_hue_var(role.Starfleet(role.Medical))
  |> should.equal("var(--hue-starfleet-science-or-medical)")

  role.federation_role_to_hue_var(role.Starfleet(role.Operations))
  |> should.equal("var(--hue-starfleet-operations-or-security)")

  role.federation_role_to_hue_var(role.Citizen)
  |> should.equal("var(--hue-federation)")
}
