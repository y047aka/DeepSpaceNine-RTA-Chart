import gleeunit
import gleeunit/should
import types/role

pub fn main() {
  gleeunit.main()
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
