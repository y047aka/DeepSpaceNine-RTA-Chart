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

pub fn federation_role_to_hue_var(role: FederationRole) -> String {
  case role {
    Starfleet(starfleet_role) -> starfleet_role_to_hue_var(starfleet_role)
    Citizen -> "var(--hue-federation)"
  }
}

pub fn starfleet_role_to_hue_var(role: StarfleetRole) -> String {
  case role {
    Command -> "var(--hue-command)"
    Operations | Security -> "55"
    Science | Medical -> "var(--hue-science-medical)"
  }
}
