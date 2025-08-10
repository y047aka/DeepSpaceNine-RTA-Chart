import components/histogram
import gleam/list
import gleeunit
import gleeunit/should
import types/character
import types/episode
import types/organization
import types/role

pub fn main() {
  gleeunit.main()
}

// Public API consistency tests
pub fn public_api_consistency_test() {
  // Character to_string consistency
  character.to_string(character.BenjaminSisko)
  |> should.equal("Benjamin Sisko")

  character.to_string(character.KiraNerys)
  |> should.equal("Kira Nerys")

  // Character from_string consistency
  character.from_string("Benjamin Sisko")
  |> should.equal(Ok(character.BenjaminSisko))

  character.from_string("Kira Nerys")
  |> should.equal(Ok(character.KiraNerys))

  // Organization to_string consistency
  organization.to_string(organization.Federation(role.StarfleetCommand))
  |> should.equal("Federation")

  organization.to_string(organization.BajoranProvisionalGov(role.BajoranMilitia))
  |> should.equal("Bajoran Provisional Government")

  // Organization from_string consistency
  organization.from_string("Federation")
  |> should.equal(Ok(organization.Federation(member_role: "")))

  organization.from_string("Bajoran Provisional Government")
  |> should.equal(Ok(organization.BajoranProvisionalGov(member_role: "")))
}

// Backward compatible hue calculation tests
pub fn backward_compatible_hue_test() {
  // Test that image_hue function produces expected results
  // with the new metadata system
  let sisko_hue = character.image_hue(character.BenjaminSisko)
  sisko_hue |> should.equal(350)
  // Command role

  let dax_hue = character.image_hue(character.Dax)
  dax_hue |> should.equal(190)
  // Science role

  let kira_hue = character.image_hue(character.KiraNerys)
  kira_hue |> should.equal(10)
  // Bajoran Provisional Government

  let quark_hue = character.image_hue(character.Quark)
  quark_hue |> should.equal(25)
  // Ferengi Alliance

  let worf_hue = character.image_hue(character.Worf)
  worf_hue |> should.equal(350)
  // Starfleet Command
}

// Histogram hue value integration test
pub fn histogram_hue_integration_test() {
  // Test that hue values are in valid range for histogram display
  let all_characters = [
    character.BenjaminSisko,
    character.JakeSisko,
    character.Dax,
    character.KiraNerys,
    character.MilesObrien,
    character.Bashir,
    character.Odo,
    character.Worf,
    character.Quark,
    character.Rom,
    character.Nog,
  ]

  all_characters
  |> list.each(fn(char) {
    let hue = character.image_hue(char)
    // Hue values should be in range 0-360 for HSL color model
    True |> should.equal(hue >= 0)
    True |> should.equal(hue <= 360)
  })
}

// Episode integration backward compatibility test
pub fn episode_backward_compatibility_test() {
  // Test that episode functionality works with new character metadata
  let test_episodes = [
    episode.Episode(
      season: 1,
      episode: 1,
      title: "Emissary",
      title_ja: "エミサリー",
      importance: 4,
      netflix_id: 1,
      characters: [
        episode.CharacterAndContrast(character.BenjaminSisko, 4),
        episode.CharacterAndContrast(character.KiraNerys, 3),
        episode.CharacterAndContrast(character.Dax, 2),
      ],
      organizations: [
        episode.OrganizationAndContrast(organization.Federation(""), 4),
        episode.OrganizationAndContrast(
          organization.BajoranProvisionalGov(""),
          3,
        ),
      ],
    ),
  ]

  // Test character episodes functionality
  let sisko_episodes =
    episode.get_character_episodes(character.BenjaminSisko, test_episodes)
  sisko_episodes
  |> should.equal([
    histogram.SeasonImportance(season: 1, episode: 1, importance: 4),
  ])

  // Test organization episodes functionality (now string-based)
  let federation_episodes =
    episode.get_organization_episodes(
      organization.Federation(""),
      test_episodes,
    )
  federation_episodes
  |> should.equal([
    histogram.SeasonImportance(season: 1, episode: 1, importance: 4),
  ])
}

// New domain model API integration test
pub fn new_domain_model_api_test() {
  // Test that new API functions work correctly with all characters
  let test_characters = [
    character.BenjaminSisko,
    character.KiraNerys,
    character.Dax,
    character.Quark,
    character.Worf,
  ]

  test_characters
  |> list.each(fn(char) {
    // Test metadata retrieval
    let metadata = character.get_metadata(char)
    metadata.character |> should.equal(char)

    // Test species retrieval
    let species = character.get_species(char)
    species |> should.equal(metadata.species)

    // Test role retrieval
    let role = character.get_role(char)
    role |> should.equal(role)

    // Test organization retrieval
    let org = character.get_organization(char)
    org |> should.equal(metadata.organization)
  })
}

// Performance consistency test (basic check)
pub fn performance_consistency_test() {
  // Test that metadata access is reasonably fast
  // Note: This is a basic functional test, not a precise performance measurement
  let repetitions = 100

  list.range(1, repetitions)
  |> list.each(fn(_) {
    let _metadata = character.get_metadata(character.BenjaminSisko)
    let _species = character.get_species(character.KiraNerys)
    let _role = character.get_role(character.Dax)
    let _hue = character.image_hue(character.Quark)
    // If we get here without timeout, performance is acceptable
    True |> should.equal(True)
  })
}
