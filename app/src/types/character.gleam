import gleam/dict.{type Dict}
import types/organization.{type Organization}
import types/role
import types/species.{type Species}

// New metadata-driven types
pub type CharacterId =
  String

pub type Character {
  Character(
    id: CharacterId,
    name: String,
    species: Species,
    organization: Organization,
  )
}

// Character constants
pub const benjamin_sisko = Character(
  id: "benjamin_sisko",
  name: "Benjamin Sisko",
  species: species.Human,
  organization: organization.Federation(role.Starfleet(role.Command)),
)

pub const jake_sisko = Character(
  id: "jake_sisko",
  name: "Jake Sisko",
  species: species.Human,
  organization: organization.Federation(role.Citizen),
)

pub const dax = Character(
  id: "dax",
  name: "Dax",
  species: species.Trill,
  organization: organization.Federation(role.Starfleet(role.Science)),
)

pub const kira_nerys = Character(
  id: "kira_nerys",
  name: "Kira Nerys",
  species: species.Bajoran,
  organization: organization.Bajor,
)

pub const miles_obrien = Character(
  id: "miles_obrien",
  name: "Miles O'Brien",
  species: species.Human,
  organization: organization.Federation(role.Starfleet(role.Operations)),
)

pub const keiko_obrien = Character(
  id: "keiko_obrien",
  name: "Keiko O'Brien",
  species: species.Human,
  organization: organization.Federation(role.Citizen),
)

pub const bashir = Character(
  id: "bashir",
  name: "Bashir",
  species: species.Human,
  organization: organization.Federation(role.Starfleet(role.Medical)),
)

pub const odo = Character(
  id: "odo",
  name: "Odo",
  species: species.Changeling,
  organization: organization.Federation(role.Starfleet(role.Security)),
)

pub const worf = Character(
  id: "worf",
  name: "Worf",
  species: species.Klingon,
  organization: organization.Federation(role.Starfleet(role.Command)),
)

pub const quark = Character(
  id: "quark",
  name: "Quark",
  species: species.Ferengi,
  organization: organization.FerengiAlliance,
)

pub const rom = Character(
  id: "rom",
  name: "Rom",
  species: species.Ferengi,
  organization: organization.FerengiAlliance,
)

pub const nog = Character(
  id: "nog",
  name: "Nog",
  species: species.Ferengi,
  organization: organization.Citizen,
)

pub const winn = Character(
  id: "winn",
  name: "Winn",
  species: species.Bajoran,
  organization: organization.Bajor,
)

pub const bareil = Character(
  id: "bareil",
  name: "Bareil",
  species: species.Bajoran,
  organization: organization.Bajor,
)

pub const garak = Character(
  id: "garak",
  name: "Garak",
  species: species.Cardassian,
  organization: organization.Citizen,
)

pub const dukat = Character(
  id: "dukat",
  name: "Dukat",
  species: species.Cardassian,
  organization: organization.CardassianUnion,
)

pub const zek = Character(
  id: "zek",
  name: "Zek",
  species: species.Ferengi,
  organization: organization.FerengiAlliance,
)

pub const michael_eddington = Character(
  id: "michael_eddington",
  name: "Michael Eddington",
  species: species.Human,
  organization: organization.Federation(role.Starfleet(role.Security)),
)

pub const kasidy_yates = Character(
  id: "kasidy_yates",
  name: "Kasidy Yates",
  species: species.Human,
  organization: organization.Federation(role.Citizen),
)

pub const leeta = Character(
  id: "leeta",
  name: "Leeta",
  species: species.Bajoran,
  organization: organization.Citizen,
)

pub const gowron = Character(
  id: "gowron",
  name: "Gowron",
  species: species.Klingon,
  organization: organization.KlingonEmpire,
)

pub const martok = Character(
  id: "martok",
  name: "Martok",
  species: species.Klingon,
  organization: organization.KlingonEmpire,
)

pub const shakaar = Character(
  id: "shakaar",
  name: "Shakaar",
  species: species.Bajoran,
  organization: organization.Bajor,
)

pub const ziyal = Character(
  id: "ziyal",
  name: "Ziyal",
  species: species.Cardassian,
  organization: organization.Citizen,
)

pub const damar = Character(
  id: "damar",
  name: "Damar",
  species: species.Cardassian,
  organization: organization.CardassianUnion,
)

pub const brunt = Character(
  id: "brunt",
  name: "Brunt",
  species: species.Ferengi,
  organization: organization.FerengiAlliance,
)

pub const weyoun = Character(
  id: "weyoun",
  name: "Weyoun",
  species: species.Vorta,
  organization: organization.DominionForces,
)

fn build_name_registry() -> Dict(String, Character) {
  dict.new()
  |> dict.insert("Benjamin Sisko", benjamin_sisko)
  |> dict.insert("Jake Sisko", jake_sisko)
  |> dict.insert("Dax", dax)
  |> dict.insert("Kira Nerys", kira_nerys)
  |> dict.insert("Miles O'Brien", miles_obrien)
  |> dict.insert("Keiko O'Brien", keiko_obrien)
  |> dict.insert("Bashir", bashir)
  |> dict.insert("Odo", odo)
  |> dict.insert("Worf", worf)
  |> dict.insert("Quark", quark)
  |> dict.insert("Rom", rom)
  |> dict.insert("Nog", nog)
  |> dict.insert("Winn", winn)
  |> dict.insert("Bareil", bareil)
  |> dict.insert("Garak", garak)
  |> dict.insert("Dukat", dukat)
  |> dict.insert("Zek", zek)
  |> dict.insert("Michael Eddington", michael_eddington)
  |> dict.insert("Kasidy Yates", kasidy_yates)
  |> dict.insert("Leeta", leeta)
  |> dict.insert("Gowron", gowron)
  |> dict.insert("Martok", martok)
  |> dict.insert("Shakaar", shakaar)
  |> dict.insert("Ziyal", ziyal)
  |> dict.insert("Damar", damar)
  |> dict.insert("Brunt", brunt)
  |> dict.insert("Weyoun", weyoun)
}

pub fn get_character_by_name(name: String) -> Result(Character, String) {
  let registry = build_name_registry()
  case dict.get(registry, name) {
    Ok(character) -> Ok(character)
    Error(_) -> Error("Unknown character name: " <> name)
  }
}

pub fn list_all_characters() -> List(Character) {
  let registry = build_name_registry()
  dict.values(registry)
}

// Character hue calculation based on organization/species
pub fn character_hue(character: Character) -> Int {
  case character.organization {
    organization.Federation(role) -> role.federation_role_to_hue(role)
    _ -> species.to_hue(character.species)
  }
}
