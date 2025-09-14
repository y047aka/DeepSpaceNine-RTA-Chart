import gleeunit
import gleeunit/should
import types/species

pub fn main() {
  gleeunit.main()
}

pub fn to_string_test() {
  species.Human |> species.to_string() |> should.equal("Human")
  species.Bajoran |> species.to_string() |> should.equal("Bajoran")
  species.JemHadar |> species.to_string() |> should.equal("Jem'Hadar")
}

pub fn from_string_test() {
  "human" |> species.from_string() |> should.equal(Ok(species.Human))
  "Human" |> species.from_string() |> should.equal(Ok(species.Human))
  "bajoran" |> species.from_string() |> should.equal(Ok(species.Bajoran))
  "jem'hadar" |> species.from_string() |> should.equal(Ok(species.JemHadar))
  "jemhadar" |> species.from_string() |> should.equal(Ok(species.JemHadar))
}

pub fn from_string_error_test() {
  "unknown_species" |> species.from_string() |> should.be_error()
}

pub fn string_roundtrip_test() {
  species.Trill
  |> species.to_string()
  |> species.from_string()
  |> should.equal(Ok(species.Trill))

  species.Changeling
  |> species.to_string()
  |> species.from_string()
  |> should.equal(Ok(species.Changeling))
}
