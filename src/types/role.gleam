import gleam/string

pub type Role {
  // Starfleet Roles
  StarfleetCommand
  StarfleetEngineering
  StarfleetSecurity
  StarfleetScience
  StarfleetMedical
  StarfleetOperations

  // Bajoran Roles
  BajoranMilitia
  BajoranReligious

  // Other Organizations
  CardassianMilitary
  KlingonWarrior
  FerengiCommerce
  DominionService

  // Special Roles
  ChangelingFounder
  VortaDiplomat
  JemHadarSoldier
}

pub fn to_string(role: Role) -> String {
  case role {
    StarfleetCommand -> "Starfleet Command"
    StarfleetEngineering -> "Starfleet Engineering"
    StarfleetSecurity -> "Starfleet Security"
    StarfleetScience -> "Starfleet Science"
    StarfleetMedical -> "Starfleet Medical"
    StarfleetOperations -> "Starfleet Operations"
    BajoranMilitia -> "Bajoran Militia"
    BajoranReligious -> "Bajoran Religious"
    CardassianMilitary -> "Cardassian Military"
    KlingonWarrior -> "Klingon Warrior"
    FerengiCommerce -> "Ferengi Commerce"
    DominionService -> "Dominion Service"
    ChangelingFounder -> "Changeling Founder"
    VortaDiplomat -> "Vorta Diplomat"
    JemHadarSoldier -> "Jem'Hadar Soldier"
  }
}

pub fn from_string(s: String) -> Result(Role, String) {
  case string.lowercase(s) {
    "starfleet command" -> Ok(StarfleetCommand)
    "starfleet engineering" -> Ok(StarfleetEngineering)
    "starfleet security" -> Ok(StarfleetSecurity)
    "starfleet science" -> Ok(StarfleetScience)
    "starfleet medical" -> Ok(StarfleetMedical)
    "starfleet operations" -> Ok(StarfleetOperations)
    "bajoran militia" -> Ok(BajoranMilitia)
    "bajoran religious" -> Ok(BajoranReligious)
    "cardassian military" -> Ok(CardassianMilitary)
    "klingon warrior" -> Ok(KlingonWarrior)
    "ferengi commerce" -> Ok(FerengiCommerce)
    "dominion service" -> Ok(DominionService)
    "changeling founder" -> Ok(ChangelingFounder)
    "vorta diplomat" -> Ok(VortaDiplomat)
    "jem'hadar soldier" -> Ok(JemHadarSoldier)
    _ -> Error("Unknown role: " <> s)
  }
}

pub fn to_hue(role: Role) -> Int {
  case role {
    StarfleetCommand -> 350
    StarfleetEngineering | StarfleetSecurity -> 55
    StarfleetScience | StarfleetMedical -> 190
    StarfleetOperations -> 220
    BajoranMilitia -> 45
    BajoranReligious -> 10
    CardassianMilitary -> 175
    KlingonWarrior -> 120
    FerengiCommerce -> 25
    DominionService | JemHadarSoldier -> 270
    ChangelingFounder -> 45
    VortaDiplomat -> 270
  }
}
