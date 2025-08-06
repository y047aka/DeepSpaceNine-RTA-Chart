import gleeunit
import gleeunit/should
import types/character
import types/episode
import types/organization

pub fn main() {
  gleeunit.main()
}

pub fn episode_types_test() {
  let name_contrast = episode.NameAndContrast("Benjamin Sisko", 85)
  name_contrast.name |> should.equal("Benjamin Sisko")
  name_contrast.contrast |> should.equal(85)

  let char_contrast = episode.CharacterAndContrast(character.BenjaminSisko, 90)
  char_contrast.character |> should.equal(character.BenjaminSisko)
  char_contrast.contrast |> should.equal(90)

  let org_contrast =
    episode.OrganizationAndContrast(organization.Federation, 75)
  org_contrast.organization |> should.equal(organization.Federation)
  org_contrast.contrast |> should.equal(75)
}

pub fn episode_creation_test() {
  let ep =
    episode.Episode(
      season: 1,
      episode: 1,
      title: "Emissary",
      title_ja: "聖なる神殿の謎",
      importance: 90,
      netflix_id: 12_345,
      characters: [],
      organizations: [],
    )

  ep.season |> should.equal(1)
  ep.episode |> should.equal(1)
  ep.title |> should.equal("Emissary")
  ep.title_ja |> should.equal("聖なる神殿の謎")
  ep.importance |> should.equal(90)
  ep.netflix_id |> should.equal(12_345)
}
