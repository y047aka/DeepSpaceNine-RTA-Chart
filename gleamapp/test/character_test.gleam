import gleeunit
import gleeunit/should
import types/character

pub fn main() {
  gleeunit.main()
}

pub fn character_to_string_test() {
  character.to_string(character.BenjaminSisko)
  |> should.equal("Benjamin Sisko")

  character.to_string(character.Dax)
  |> should.equal("Dax")

  character.to_string(character.KiraNerys)
  |> should.equal("Kira Nerys")
}

pub fn character_from_string_test() {
  character.from_string("Benjamin Sisko")
  |> should.equal(Ok(character.BenjaminSisko))

  character.from_string("Dax")
  |> should.equal(Ok(character.Dax))

  character.from_string("Unknown Character")
  |> should.be_error()
}

pub fn character_image_hue_test() {
  character.image_hue(character.BenjaminSisko)
  |> should.equal(350)

  character.image_hue(character.Dax)
  |> should.equal(190)

  character.image_hue(character.KiraNerys)
  |> should.equal(10)
}
