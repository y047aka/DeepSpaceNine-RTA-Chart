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
