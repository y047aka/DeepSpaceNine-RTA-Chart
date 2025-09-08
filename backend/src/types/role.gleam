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
