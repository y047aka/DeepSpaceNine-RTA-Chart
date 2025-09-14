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

pub fn to_id(org: Organization) -> String {
  case org {
    Federation(_) -> "federation"
    CardassianUnion -> "cardassian_union"
    KlingonEmpire -> "klingon_empire"
    DominionForces -> "dominion"
    Bajor -> "bajor"
    FerengiAlliance -> "ferengi_alliance"
    Prophets -> "prophets"
    TrillSymbiosisCommission -> "trill_symbiosis_commission"
    Maquis -> "maquis"
    MirrorUniverse -> "mirror_universe"
    Independent -> "independent"
    Citizen -> "citizen"
  }
}

pub fn from_id(id: String) -> Result(Organization, String) {
  case id {
    "federation" -> Ok(Federation(role.Citizen))
    "cardassian_union" -> Ok(CardassianUnion)
    "klingon_empire" -> Ok(KlingonEmpire)
    "dominion" -> Ok(DominionForces)
    "bajor" -> Ok(Bajor)
    "ferengi_alliance" -> Ok(FerengiAlliance)
    "prophets" -> Ok(Prophets)
    "trill_symbiosis_commission" -> Ok(TrillSymbiosisCommission)
    "maquis" -> Ok(Maquis)
    "mirror_universe" -> Ok(MirrorUniverse)
    "independent" -> Ok(Independent)
    "citizen" -> Ok(Citizen)
    _ -> Error("Unknown organization id: " <> id)
  }
}

pub fn to_hue_var(org: Organization) -> String {
  case org {
    Federation(_) -> "var(--hue-federation)"
    CardassianUnion -> "var(--hue-cardassian)"
    KlingonEmpire -> "var(--hue-klingon)"
    DominionForces -> "var(--hue-dominion)"
    Bajor -> "var(--hue-bajoran)"
    FerengiAlliance -> "var(--hue-ferengi)"
    Prophets -> "var(--hue-bajoran)"
    TrillSymbiosisCommission -> "var(--hue-starfleet-science-or-medical)"
    Maquis -> "var(--hue-starfleet-command)"
    MirrorUniverse -> "var(--hue-starfleet-command)"
    Independent -> "var(--hue-federation)"
    Citizen -> "var(--hue-federation)"
  }
}
