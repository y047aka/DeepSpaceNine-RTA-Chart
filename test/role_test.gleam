import gleeunit
import gleeunit/should
import types/role

pub fn main() {
  gleeunit.main()
}

pub fn to_string_test() {
  role.StarfleetCommand |> role.to_string() |> should.equal("Starfleet Command")
  role.BajoranMilitia |> role.to_string() |> should.equal("Bajoran Militia")
  role.DominionService |> role.to_string() |> should.equal("Dominion Service")
  role.JemHadarSoldier |> role.to_string() |> should.equal("Jem'Hadar Soldier")
}

pub fn from_string_test() {
  "starfleet command"
  |> role.from_string()
  |> should.equal(Ok(role.StarfleetCommand))
  "Starfleet Command"
  |> role.from_string()
  |> should.equal(Ok(role.StarfleetCommand))
  "bajoran militia"
  |> role.from_string()
  |> should.equal(Ok(role.BajoranMilitia))
  "jem'hadar soldier"
  |> role.from_string()
  |> should.equal(Ok(role.JemHadarSoldier))
}

pub fn from_string_error_test() {
  "unknown_role" |> role.from_string() |> should.be_error()
}

pub fn to_hue_test() {
  role.StarfleetCommand |> role.to_hue() |> should.equal(350)
  role.StarfleetEngineering |> role.to_hue() |> should.equal(55)
  role.StarfleetSecurity |> role.to_hue() |> should.equal(55)
  role.StarfleetScience |> role.to_hue() |> should.equal(190)
  role.StarfleetMedical |> role.to_hue() |> should.equal(190)
  role.BajoranMilitia |> role.to_hue() |> should.equal(45)
  role.BajoranReligious |> role.to_hue() |> should.equal(10)
  role.DominionService |> role.to_hue() |> should.equal(270)
  role.VortaDiplomat |> role.to_hue() |> should.equal(270)
  role.JemHadarSoldier |> role.to_hue() |> should.equal(270)
}

pub fn string_roundtrip_test() {
  role.StarfleetCommand
  |> role.to_string()
  |> role.from_string()
  |> should.equal(Ok(role.StarfleetCommand))

  role.VortaDiplomat
  |> role.to_string()
  |> role.from_string()
  |> should.equal(Ok(role.VortaDiplomat))
}
