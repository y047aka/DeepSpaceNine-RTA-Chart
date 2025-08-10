import types/organization.{type Organization}
import types/role.{type Role}
import types/species.{type Species}

pub type Character {
  BenjaminSisko
  JakeSisko
  Dax
  KiraNerys
  MilesObrien
  KeikoObrien
  Bashir
  Odo
  Worf
  Quark
  Rom
  Nog
  Winn
  Bareil
  Garak
  Dukat
  Zek
  MichaelEddington
  KasidyYates
  Leeta
  Gowron
  Martok
  Shakaar
  Ziyal
  Damar
  Brunt
  Weyoun
}

pub type CharacterMetadata {
  CharacterMetadata(
    character: Character,
    species: Species,
    organization: Organization(Role),
  )
}

pub fn to_string(character: Character) -> String {
  case character {
    BenjaminSisko -> "Benjamin Sisko"
    JakeSisko -> "Jake Sisko"
    Dax -> "Dax"
    KiraNerys -> "Kira Nerys"
    MilesObrien -> "Miles O'Brien"
    KeikoObrien -> "Keiko O'Brien"
    Bashir -> "Bashir"
    Odo -> "Odo"
    Worf -> "Worf"
    Quark -> "Quark"
    Rom -> "Rom"
    Nog -> "Nog"
    Winn -> "Winn"
    Bareil -> "Bareil"
    Garak -> "Garak"
    Dukat -> "Dukat"
    Zek -> "Zek"
    MichaelEddington -> "Michael Eddington"
    KasidyYates -> "Kasidy Yates"
    Leeta -> "Leeta"
    Gowron -> "Gowron"
    Martok -> "Martok"
    Shakaar -> "Shakaar"
    Ziyal -> "Ziyal"
    Damar -> "Damar"
    Brunt -> "Brunt"
    Weyoun -> "Weyoun"
  }
}

pub fn from_string(s: String) -> Result(Character, String) {
  case s {
    "Benjamin Sisko" -> Ok(BenjaminSisko)
    "Jake Sisko" -> Ok(JakeSisko)
    "Dax" -> Ok(Dax)
    "Kira Nerys" -> Ok(KiraNerys)
    "Miles O'Brien" -> Ok(MilesObrien)
    "Keiko O'Brien" -> Ok(KeikoObrien)
    "Bashir" -> Ok(Bashir)
    "Odo" -> Ok(Odo)
    "Worf" -> Ok(Worf)
    "Quark" -> Ok(Quark)
    "Rom" -> Ok(Rom)
    "Nog" -> Ok(Nog)
    "Winn" -> Ok(Winn)
    "Bareil" -> Ok(Bareil)
    "Garak" -> Ok(Garak)
    "Dukat" -> Ok(Dukat)
    "Zek" -> Ok(Zek)
    "Michael Eddington" -> Ok(MichaelEddington)
    "Kasidy Yates" -> Ok(KasidyYates)
    "Leeta" -> Ok(Leeta)
    "Gowron" -> Ok(Gowron)
    "Martok" -> Ok(Martok)
    "Shakaar" -> Ok(Shakaar)
    "Ziyal" -> Ok(Ziyal)
    "Damar" -> Ok(Damar)
    "Brunt" -> Ok(Brunt)
    "Weyoun" -> Ok(Weyoun)
    _ -> Error("Unknown character: " <> s)
  }
}

pub fn image_hue(character: Character) -> Int {
  let metadata = get_metadata(character)
  case metadata.organization {
    organization.Federation(role) -> role.to_hue(role)
    _ -> species.to_hue(metadata.species)
  }
}

// Character metadata map
pub fn get_metadata(character: Character) -> CharacterMetadata {
  case character {
    BenjaminSisko ->
      CharacterMetadata(
        character: BenjaminSisko,
        species: species.Human,
        organization: organization.Federation(role.StarfleetCommand),
      )
    JakeSisko ->
      CharacterMetadata(
        character: JakeSisko,
        species: species.Human,
        organization: organization.Independent,
      )
    Dax ->
      CharacterMetadata(
        character: Dax,
        species: species.Trill,
        organization: organization.Federation(role.StarfleetScience),
      )
    KiraNerys ->
      CharacterMetadata(
        character: KiraNerys,
        species: species.Bajoran,
        organization: organization.BajoranProvisionalGov(role.BajoranMilitia),
      )
    MilesObrien ->
      CharacterMetadata(
        character: MilesObrien,
        species: species.Human,
        organization: organization.Federation(role.StarfleetEngineering),
      )
    KeikoObrien ->
      CharacterMetadata(
        character: KeikoObrien,
        species: species.Human,
        organization: organization.Independent,
      )
    Bashir ->
      CharacterMetadata(
        character: Bashir,
        species: species.Human,
        organization: organization.Federation(role.StarfleetMedical),
      )
    Odo ->
      CharacterMetadata(
        character: Odo,
        species: species.Changeling,
        organization: organization.Federation(role.StarfleetSecurity),
      )
    Worf ->
      CharacterMetadata(
        character: Worf,
        species: species.Klingon,
        organization: organization.Federation(role.StarfleetCommand),
      )
    Quark ->
      CharacterMetadata(
        character: Quark,
        species: species.Ferengi,
        organization: organization.FerengiAlliance,
      )
    Rom ->
      CharacterMetadata(
        character: Rom,
        species: species.Ferengi,
        organization: organization.FerengiAlliance,
      )
    Nog ->
      CharacterMetadata(
        character: Nog,
        species: species.Ferengi,
        organization: organization.FerengiAlliance,
      )
    Winn ->
      CharacterMetadata(
        character: Winn,
        species: species.Bajoran,
        organization: organization.BajoranReligion,
      )
    Bareil ->
      CharacterMetadata(
        character: Bareil,
        species: species.Bajoran,
        organization: organization.BajoranReligion,
      )
    Garak ->
      CharacterMetadata(
        character: Garak,
        species: species.Cardassian,
        organization: organization.CardassianUnion,
      )
    Dukat ->
      CharacterMetadata(
        character: Dukat,
        species: species.Cardassian,
        organization: organization.CardassianUnion,
      )
    Zek ->
      CharacterMetadata(
        character: Zek,
        species: species.Ferengi,
        organization: organization.FerengiAlliance,
      )
    MichaelEddington ->
      CharacterMetadata(
        character: MichaelEddington,
        species: species.Human,
        organization: organization.Federation(role.StarfleetSecurity),
      )
    KasidyYates ->
      CharacterMetadata(
        character: KasidyYates,
        species: species.Human,
        organization: organization.Independent,
      )
    Leeta ->
      CharacterMetadata(
        character: Leeta,
        species: species.Bajoran,
        organization: organization.BajoranReligion,
      )
    Gowron ->
      CharacterMetadata(
        character: Gowron,
        species: species.Klingon,
        organization: organization.KlingonEmpire,
      )
    Martok ->
      CharacterMetadata(
        character: Martok,
        species: species.Klingon,
        organization: organization.KlingonEmpire,
      )
    Shakaar ->
      CharacterMetadata(
        character: Shakaar,
        species: species.Bajoran,
        organization: organization.BajoranProvisionalGov(role.BajoranMilitia),
      )
    Ziyal ->
      CharacterMetadata(
        character: Ziyal,
        species: species.Cardassian,
        organization: organization.CardassianUnion,
      )
    Damar ->
      CharacterMetadata(
        character: Damar,
        species: species.Cardassian,
        organization: organization.CardassianUnion,
      )
    Brunt ->
      CharacterMetadata(
        character: Brunt,
        species: species.Ferengi,
        organization: organization.FerengiAlliance,
      )
    Weyoun ->
      CharacterMetadata(
        character: Weyoun,
        species: species.Vorta,
        organization: organization.DominionForces(role.VortaDiplomat),
      )
  }
}

// Convenience accessor functions
pub fn get_species(character: Character) -> Species {
  let metadata = get_metadata(character)
  metadata.species
}

pub fn get_role(character: Character) -> Role {
  let metadata = get_metadata(character)
  case metadata.organization {
    organization.Federation(role) -> role
    organization.BajoranProvisionalGov(role) -> role
    organization.DominionForces(role) -> role
    organization.FerengiAlliance -> role.FerengiCommerce
    organization.CardassianUnion -> role.CardassianMilitary
    organization.KlingonEmpire -> role.KlingonWarrior
    organization.BajoranReligion -> role.BajoranReligious
    organization.ProphetsTemple -> role.BajoranReligious
    organization.TrillSymbiosisCommission -> role.StarfleetScience
    organization.Maquis -> role.StarfleetSecurity
    organization.MirrorUniverse -> role.StarfleetCommand
    organization.Independent -> role.StarfleetOperations
  }
}

pub fn get_organization(character: Character) -> Organization(Role) {
  let metadata = get_metadata(character)
  metadata.organization
}
