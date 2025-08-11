import gleam/string

// Federation role hierarchy
pub type FederationRole {
  Starfleet(StarfleetRole)
  Citizen
}

// Starfleet-specific roles
pub type StarfleetRole {
  Command
  Security
  Science
  Medical
  Operations
}

// Federation role functions
pub fn federation_role_to_string(role: FederationRole) -> String {
  case role {
    Starfleet(starfleet_role) -> starfleet_role_to_string(starfleet_role)
    Citizen -> "Federation Citizen"
  }
}

// Starfleet role functions
pub fn starfleet_role_to_string(role: StarfleetRole) -> String {
  case role {
    Command -> "Starfleet Command"
    Security -> "Starfleet Security"
    Science -> "Starfleet Science"
    Medical -> "Starfleet Medical"
    Operations -> "Starfleet Operations"
  }
}

pub fn federation_role_from_string(s: String) -> Result(FederationRole, String) {
  case string.lowercase(s) {
    "starfleet command" -> Ok(Starfleet(Command))
    "starfleet security" -> Ok(Starfleet(Security))
    "starfleet science" -> Ok(Starfleet(Science))
    "starfleet medical" -> Ok(Starfleet(Medical))
    "starfleet operations" -> Ok(Starfleet(Operations))
    "federation citizen" -> Ok(Citizen)
    _ -> Error("Unknown Federation role: " <> s)
  }
}

pub fn starfleet_role_from_string(s: String) -> Result(StarfleetRole, String) {
  case string.lowercase(s) {
    "starfleet command" -> Ok(Command)
    "starfleet security" -> Ok(Security)
    "starfleet science" -> Ok(Science)
    "starfleet medical" -> Ok(Medical)
    "starfleet operations" -> Ok(Operations)
    _ -> Error("Unknown Starfleet role: " <> s)
  }
}

pub fn federation_role_to_hue(role: FederationRole) -> Int {
  case role {
    Starfleet(starfleet_role) -> starfleet_role_to_hue(starfleet_role)
    Citizen -> 220
  }
}

pub fn starfleet_role_to_hue(role: StarfleetRole) -> Int {
  case role {
    Command -> 350
    Operations | Security -> 55
    Science | Medical -> 190
  }
}
