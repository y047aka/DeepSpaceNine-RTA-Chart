import types/role.{type FederationRole}

// Organization type with specific role constraints
pub type Organization {
  Federation(member_role: FederationRole)
  CardassianUnion
  KlingonEmpire
  DominionForces
  Bajor
  FerengiAlliance

  // Religious/Cultural Organizations
  Prophets
  TrillSymbiosisCommission

  // Special Organizations
  Maquis
  MirrorUniverse

  // Independent
  Independent

  // Civilian
  Citizen
}

pub fn to_string(org: Organization) -> String {
  case org {
    Federation(_) -> "Federation"
    CardassianUnion -> "Cardassian Union"
    KlingonEmpire -> "Klingon Empire"
    DominionForces -> "Dominion"
    Bajor -> "Bajor"
    FerengiAlliance -> "Ferengi Alliance"
    Prophets -> "Prophets"
    TrillSymbiosisCommission -> "Trill Symbiosis Commission"
    Maquis -> "Maquis"
    MirrorUniverse -> "Mirror Universe"
    Independent -> "Independent"
    Citizen -> "Citizen"
  }
}

pub fn from_string(s: String) -> Result(Organization, String) {
  case s {
    "Federation" -> Ok(Federation(role.Citizen))
    "Federation Citizen" -> Ok(Federation(role.Citizen))
    "Cardassian Union" | "Cardassia" -> Ok(CardassianUnion)
    "Klingon Empire" | "Klingon" -> Ok(KlingonEmpire)
    "Dominion" -> Ok(DominionForces)
    "Bajor" -> Ok(Bajor)
    "Prophets" | "Prophet" -> Ok(Prophets)
    "Ferengi Alliance" | "Ferengi" -> Ok(FerengiAlliance)
    "Trill Symbiosis Commission" | "Trill" -> Ok(TrillSymbiosisCommission)
    "Maquis" -> Ok(Maquis)
    "Mirror Universe" -> Ok(MirrorUniverse)
    "Independent" -> Ok(Independent)
    "Citizen" -> Ok(Citizen)
    _ -> Error("Unknown organization: " <> s)
  }
}

pub fn to_hue(org: Organization) -> Int {
  let command = 350
  let science_or_medical = 190
  let federation = 220
  let bajoran = 10
  let cardassian = 175
  let klingon = 120
  let ferengi = 25
  let dominion = 270

  case org {
    Federation(_) -> federation
    CardassianUnion -> cardassian
    KlingonEmpire -> klingon
    DominionForces -> dominion
    Bajor -> bajoran
    FerengiAlliance -> ferengi
    Prophets -> bajoran
    TrillSymbiosisCommission -> science_or_medical
    Maquis -> command
    MirrorUniverse -> command
    Independent -> federation
    Citizen -> federation
  }
}
