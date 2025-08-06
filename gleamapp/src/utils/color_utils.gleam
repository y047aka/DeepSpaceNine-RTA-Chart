// TDD Green Phase: Implement color utility functions
// Based on design.md character and organization hue mappings

pub fn get_character_hue(character_name: String) -> Int {
  // Color mappings from design.md
  let command = 350
  let engineering_or_security = 55
  let science_or_medical = 190
  let bajoran_security = 45
  let federation = 220
  let bajoran = 10
  let cardassian = 175
  let klingon = 120
  let ferengi = 25
  let jem_hadar = 270

  case character_name {
    "Benjamin Sisko" -> command
    "Jake Sisko" -> federation
    "Dax" -> science_or_medical
    "Kira Nerys" -> bajoran
    "Miles O'Brien" -> engineering_or_security
    "Keiko O'Brien" -> federation
    "Bashir" -> science_or_medical
    "Odo" -> bajoran_security
    "Worf" -> command
    "Quark" -> ferengi
    "Rom" -> ferengi
    "Nog" -> ferengi
    "Winn" -> bajoran
    "Bareil" -> bajoran
    "Garak" -> cardassian
    "Dukat" -> cardassian
    "Zek" -> ferengi
    "Michael Eddington" -> engineering_or_security
    "Kasidy Yates" -> federation
    "Leeta" -> bajoran
    "Gowron" -> klingon
    "Martok" -> klingon
    "Shakaar" -> bajoran
    "Ziyal" -> cardassian
    "Damar" -> cardassian
    "Brunt" -> ferengi
    "Weyoun" -> jem_hadar
    _ -> federation
    // Default fallback
  }
}

pub fn get_organization_hue(organization_name: String) -> Int {
  // Color mappings from design.md
  let command = 350
  let science_or_medical = 190
  let federation = 220
  let bajoran = 10
  let cardassian = 175
  let klingon = 120
  let ferengi = 25
  let dominion = 270

  case organization_name {
    "Federation" -> federation
    "Trill" -> science_or_medical
    "Bajor" -> bajoran
    "Prophet" -> bajoran
    "Cardassia" -> cardassian
    "Ferengi" -> ferengi
    "Klingon" -> klingon
    "Maquis" -> command
    "Dominion" -> dominion
    "Mirror Universe" -> command
    _ -> federation
    // Default fallback
  }
}
