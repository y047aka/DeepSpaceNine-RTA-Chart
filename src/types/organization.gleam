// Organization type with role constraints
pub type Organization(role) {
  Federation(member_role: role)
  CardassianUnion
  KlingonEmpire
  DominionForces(member_role: role)
  Bajor(member_role: role)
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

pub fn to_string(org: Organization(role)) -> String {
  case org {
    Federation(_) -> "Federation"
    CardassianUnion -> "Cardassian Union"
    KlingonEmpire -> "Klingon Empire"
    DominionForces(_) -> "Dominion"
    Bajor(_) -> "Bajor"
    FerengiAlliance -> "Ferengi Alliance"
    Prophets -> "Prophets"
    TrillSymbiosisCommission -> "Trill Symbiosis Commission"
    Maquis -> "Maquis"
    MirrorUniverse -> "Mirror Universe"
    Independent -> "Independent"
    Citizen -> "Citizen"
  }
}

pub fn from_string(s: String) -> Result(Organization(String), String) {
  case s {
    "Federation" -> Ok(Federation(member_role: ""))
    "Cardassian Union" | "Cardassia" -> Ok(CardassianUnion)
    "Klingon Empire" | "Klingon" -> Ok(KlingonEmpire)
    "Dominion" -> Ok(DominionForces(member_role: ""))
    "Bajor" -> Ok(Bajor(member_role: ""))
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

pub fn to_hue(org: Organization(role)) -> Int {
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
    DominionForces(_) -> dominion
    Bajor(_) -> bajoran
    FerengiAlliance -> ferengi
    Prophets -> bajoran
    TrillSymbiosisCommission -> science_or_medical
    Maquis -> command
    MirrorUniverse -> command
    Independent -> federation
    Citizen -> federation
  }
}
