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
