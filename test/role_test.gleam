import gleeunit
import gleeunit/should
import types/role

pub fn main() {
  gleeunit.main()
}

// FederationRole tests
pub fn federation_role_to_string_test() {
  role.federation_role_to_string(role.Starfleet(role.Command))
  |> should.equal("Starfleet Command")

  role.federation_role_to_string(role.Citizen)
  |> should.equal("Federation Citizen")

  role.federation_role_to_string(role.Starfleet(role.Security))
  |> should.equal("Starfleet Security")

  role.federation_role_to_string(role.Starfleet(role.Science))
  |> should.equal("Starfleet Science")

  role.federation_role_to_string(role.Starfleet(role.Medical))
  |> should.equal("Starfleet Medical")

  role.federation_role_to_string(role.Starfleet(role.Operations))
  |> should.equal("Starfleet Operations")
}

// StarfleetRole tests
pub fn starfleet_role_to_string_test() {
  role.starfleet_role_to_string(role.Command)
  |> should.equal("Starfleet Command")

  role.starfleet_role_to_string(role.Security)
  |> should.equal("Starfleet Security")

  role.starfleet_role_to_string(role.Science)
  |> should.equal("Starfleet Science")

  role.starfleet_role_to_string(role.Medical)
  |> should.equal("Starfleet Medical")

  role.starfleet_role_to_string(role.Operations)
  |> should.equal("Starfleet Operations")
}

pub fn federation_role_from_string_test() {
  "starfleet command"
  |> role.federation_role_from_string()
  |> should.equal(Ok(role.Starfleet(role.Command)))

  "Federation Citizen"
  |> role.federation_role_from_string()
  |> should.equal(Ok(role.Citizen))

  "STARFLEET SECURITY"
  |> role.federation_role_from_string()
  |> should.equal(Ok(role.Starfleet(role.Security)))

  "unknown_federation_role"
  |> role.federation_role_from_string()
  |> should.be_error()
}

pub fn starfleet_role_from_string_test() {
  "starfleet command"
  |> role.starfleet_role_from_string()
  |> should.equal(Ok(role.Command))

  "STARFLEET SECURITY"
  |> role.starfleet_role_from_string()
  |> should.equal(Ok(role.Security))

  "unknown_starfleet_role"
  |> role.starfleet_role_from_string()
  |> should.be_error()
}

pub fn federation_role_to_hue_test() {
  role.federation_role_to_hue(role.Starfleet(role.Command))
  |> should.equal(350)

  role.federation_role_to_hue(role.Citizen)
  |> should.equal(220)

  role.federation_role_to_hue(role.Starfleet(role.Security))
  |> should.equal(55)

  role.federation_role_to_hue(role.Starfleet(role.Science))
  |> should.equal(190)

  role.federation_role_to_hue(role.Starfleet(role.Medical))
  |> should.equal(190)

  role.federation_role_to_hue(role.Starfleet(role.Operations))
  |> should.equal(55)
}

pub fn starfleet_role_to_hue_test() {
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

// Role consistency tests
pub fn federation_role_round_trip_test() {
  role.Starfleet(role.Command)
  |> role.federation_role_to_string()
  |> role.federation_role_from_string()
  |> should.equal(Ok(role.Starfleet(role.Command)))

  role.Citizen
  |> role.federation_role_to_string()
  |> role.federation_role_from_string()
  |> should.equal(Ok(role.Citizen))
}

pub fn starfleet_role_round_trip_test() {
  role.Command
  |> role.starfleet_role_to_string()
  |> role.starfleet_role_from_string()
  |> should.equal(Ok(role.Command))

  role.Science
  |> role.starfleet_role_to_string()
  |> role.starfleet_role_from_string()
  |> should.equal(Ok(role.Science))
}
