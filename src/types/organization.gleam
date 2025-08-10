// Legacy Organization type for backward compatibility
pub type Organization {
  Federation
  Trill
  Bajor
  Prophet
  Cardassia
  Ferengi
  Klingon
  Maquis
  Dominion
  MirrorUniverse
}

// Generic Organization type with role constraints
pub type GenericOrganization(role) {
  GenericFederation(member_role: role)
  CardassianUnion
  KlingonEmpire
  DominionForces(member_role: role)
  BajoranProvisionalGov(member_role: role)
  FerengiAlliance

  // Religious/Cultural Organizations
  BajoranReligion
  ProphetsTemple
  TrillSymbiosisCommission

  // Special Organizations
  GenericMaquis
  GenericMirrorUniverse

  // Independent
  Independent
}

pub fn to_string(organization: Organization) -> String {
  case organization {
    Federation -> "Federation"
    Trill -> "Trill"
    Bajor -> "Bajor"
    Prophet -> "Prophet"
    Cardassia -> "Cardassia"
    Ferengi -> "Ferengi"
    Klingon -> "Klingon"
    Maquis -> "Maquis"
    Dominion -> "Dominion"
    MirrorUniverse -> "Mirror Universe"
  }
}

pub fn from_string(s: String) -> Result(Organization, String) {
  case s {
    "Federation" -> Ok(Federation)
    "Trill" -> Ok(Trill)
    "Bajor" -> Ok(Bajor)
    "Prophet" -> Ok(Prophet)
    "Cardassia" -> Ok(Cardassia)
    "Ferengi" -> Ok(Ferengi)
    "Klingon" -> Ok(Klingon)
    "Maquis" -> Ok(Maquis)
    "Dominion" -> Ok(Dominion)
    "Mirror Universe" -> Ok(MirrorUniverse)
    _ -> Error("Unknown organization: " <> s)
  }
}

pub fn image_hue(organization: Organization) -> Int {
  let command = 350
  let science_or_medical = 190
  let federation = 220
  let bajoran = 10
  let cardassian = 175
  let klingon = 120
  let ferengi = 25
  let dominion = 270

  case organization {
    Federation -> federation
    Trill -> science_or_medical
    Bajor -> bajoran
    Prophet -> bajoran
    Cardassia -> cardassian
    Ferengi -> ferengi
    Klingon -> klingon
    Maquis -> command
    Dominion -> dominion
    MirrorUniverse -> command
  }
}

// GenericOrganization functions
pub fn generic_to_string(org: GenericOrganization(role)) -> String {
  case org {
    GenericFederation(_) -> "Federation"
    CardassianUnion -> "Cardassian Union"
    KlingonEmpire -> "Klingon Empire"
    DominionForces(_) -> "Dominion"
    BajoranProvisionalGov(_) -> "Bajoran Provisional Government"
    FerengiAlliance -> "Ferengi Alliance"
    BajoranReligion -> "Bajoran Religion"
    ProphetsTemple -> "Prophets Temple"
    TrillSymbiosisCommission -> "Trill Symbiosis Commission"
    GenericMaquis -> "Maquis"
    GenericMirrorUniverse -> "Mirror Universe"
    Independent -> "Independent"
  }
}

pub fn generic_from_string(
  s: String,
) -> Result(GenericOrganization(String), String) {
  case s {
    "Federation" -> Ok(GenericFederation(member_role: ""))
    "Cardassian Union" -> Ok(CardassianUnion)
    "Klingon Empire" -> Ok(KlingonEmpire)
    "Dominion" -> Ok(DominionForces(member_role: ""))
    "Bajoran Provisional Government" ->
      Ok(BajoranProvisionalGov(member_role: ""))
    "Ferengi Alliance" -> Ok(FerengiAlliance)
    "Bajoran Religion" -> Ok(BajoranReligion)
    "Prophets Temple" -> Ok(ProphetsTemple)
    "Trill Symbiosis Commission" -> Ok(TrillSymbiosisCommission)
    "Maquis" -> Ok(GenericMaquis)
    "Mirror Universe" -> Ok(GenericMirrorUniverse)
    "Independent" -> Ok(Independent)
    _ -> Error("Unknown organization: " <> s)
  }
}

pub fn generic_to_hue(org: GenericOrganization(role)) -> Int {
  let command = 350
  let science_or_medical = 190
  let federation = 220
  let bajoran = 10
  let cardassian = 175
  let klingon = 120
  let ferengi = 25
  let dominion = 270

  case org {
    GenericFederation(_) -> federation
    CardassianUnion -> cardassian
    KlingonEmpire -> klingon
    DominionForces(_) -> dominion
    BajoranProvisionalGov(_) -> bajoran
    FerengiAlliance -> ferengi
    BajoranReligion -> bajoran
    ProphetsTemple -> bajoran
    TrillSymbiosisCommission -> science_or_medical
    GenericMaquis -> command
    GenericMirrorUniverse -> command
    Independent -> federation
  }
}
