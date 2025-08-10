import types/organization.{type GenericOrganization}
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
    organization: GenericOrganization(Role),
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
    organization.GenericFederation(role) -> role.to_hue(role)
    org -> organization.generic_to_hue(org)
  }
}

// Character metadata map
pub fn get_metadata(character: Character) -> CharacterMetadata {
  case character {
    BenjaminSisko ->
      CharacterMetadata(
        character: BenjaminSisko,
        species: species.Human,
        organization: organization.GenericFederation(role.StarfleetCommand),
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
        organization: organization.GenericFederation(role.StarfleetScience),
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
        organization: organization.GenericFederation(role.StarfleetEngineering),
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
        organization: organization.GenericFederation(role.StarfleetMedical),
      )
    Odo ->
      CharacterMetadata(
        character: Odo,
        species: species.Changeling,
        organization: organization.GenericFederation(role.StarfleetSecurity),
      )
    Worf ->
      CharacterMetadata(
        character: Worf,
        species: species.Klingon,
        organization: organization.GenericFederation(role.StarfleetCommand),
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
        organization: organization.GenericFederation(role.StarfleetSecurity),
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
    organization.GenericFederation(role) -> role
    organization.BajoranProvisionalGov(role) -> role
    organization.DominionForces(role) -> role
    organization.FerengiAlliance -> role.FerengiCommerce
    organization.CardassianUnion -> role.CardassianMilitary
    organization.KlingonEmpire -> role.KlingonWarrior
    organization.BajoranReligion -> role.BajoranReligious
    organization.ProphetsTemple -> role.BajoranReligious
    organization.TrillSymbiosisCommission -> role.StarfleetScience
    organization.GenericMaquis -> role.StarfleetSecurity
    organization.GenericMirrorUniverse -> role.StarfleetCommand
    organization.Independent -> role.StarfleetOperations
  }
}

pub fn get_organization(character: Character) -> GenericOrganization(Role) {
  let metadata = get_metadata(character)
  metadata.organization
}

// Legacy compatibility layer
pub fn legacy_organization_mapping(
  legacy_org_name: String,
) -> Result(GenericOrganization(Role), String) {
  case legacy_org_name {
    "Federation" -> Ok(organization.GenericFederation(role.StarfleetOperations))
    "Trill" -> Ok(organization.TrillSymbiosisCommission)
    "Bajor" -> Ok(organization.BajoranProvisionalGov(role.BajoranMilitia))
    "Prophet" -> Ok(organization.BajoranReligion)
    "Cardassia" -> Ok(organization.CardassianUnion)
    "Ferengi" -> Ok(organization.FerengiAlliance)
    "Klingon" -> Ok(organization.KlingonEmpire)
    "Maquis" -> Ok(organization.GenericMaquis)
    "Dominion" -> Ok(organization.DominionForces(role.DominionService))
    "Mirror Universe" -> Ok(organization.GenericMirrorUniverse)
    _ -> Error("Unknown legacy organization: " <> legacy_org_name)
  }
}

pub fn legacy_species_from_organization(
  legacy_org_name: String,
) -> Result(Species, String) {
  case legacy_org_name {
    "Trill" -> Ok(species.Trill)
    "Bajor" -> Ok(species.Bajoran)
    "Cardassia" -> Ok(species.Cardassian)
    "Ferengi" -> Ok(species.Ferengi)
    "Klingon" -> Ok(species.Klingon)
    "Federation" -> Ok(species.Human)
    // Default assumption
    _ -> Ok(species.Human)
    // Safe default
  }
}
