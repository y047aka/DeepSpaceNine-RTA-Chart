pub type Organization {
  Federation
  Trill
  Bajor
  Prophet
  Cardassia
  Ferengi
  Klingon
  Maquis
  Dominion
  MirrorUniverse
}

pub fn to_string(organization: Organization) -> String {
  case organization {
    Federation -> "Federation"
    Trill -> "Trill"
    Bajor -> "Bajor"
    Prophet -> "Prophet"
    Cardassia -> "Cardassia"
    Ferengi -> "Ferengi"
    Klingon -> "Klingon"
    Maquis -> "Maquis"
    Dominion -> "Dominion"
    MirrorUniverse -> "Mirror Universe"
  }
}

pub fn from_string(s: String) -> Result(Organization, String) {
  case s {
    "Federation" -> Ok(Federation)
    "Trill" -> Ok(Trill)
    "Bajor" -> Ok(Bajor)
    "Prophet" -> Ok(Prophet)
    "Cardassia" -> Ok(Cardassia)
    "Ferengi" -> Ok(Ferengi)
    "Klingon" -> Ok(Klingon)
    "Maquis" -> Ok(Maquis)
    "Dominion" -> Ok(Dominion)
    "Mirror Universe" -> Ok(MirrorUniverse)
    _ -> Error("Unknown organization: " <> s)
  }
}

pub fn image_hue(organization: Organization) -> Int {
  let command = 350
  let science_or_medical = 190
  let federation = 220
  let bajoran = 10
  let cardassian = 175
  let klingon = 120
  let ferengi = 25
  let dominion = 270

  case organization {
    Federation -> federation
    Trill -> science_or_medical
    Bajor -> bajoran
    Prophet -> bajoran
    Cardassia -> cardassian
    Ferengi -> ferengi
    Klingon -> klingon
    Maquis -> command
    Dominion -> dominion
    MirrorUniverse -> command
  }
}
