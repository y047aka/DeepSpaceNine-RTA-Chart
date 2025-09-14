import gleam/string

pub type Species {
  Human
  Bajoran
  Cardassian
  Klingon
  Ferengi
  Trill
  Changeling
  Vorta
  JemHadar
}

pub fn to_string(species: Species) -> String {
  case species {
    Human -> "Human"
    Bajoran -> "Bajoran"
    Cardassian -> "Cardassian"
    Klingon -> "Klingon"
    Ferengi -> "Ferengi"
    Trill -> "Trill"
    Changeling -> "Changeling"
    Vorta -> "Vorta"
    JemHadar -> "Jem'Hadar"
  }
}

pub fn from_string(s: String) -> Result(Species, String) {
  case string.lowercase(s) {
    "human" -> Ok(Human)
    "bajoran" -> Ok(Bajoran)
    "cardassian" -> Ok(Cardassian)
    "klingon" -> Ok(Klingon)
    "ferengi" -> Ok(Ferengi)
    "trill" -> Ok(Trill)
    "changeling" -> Ok(Changeling)
    "vorta" -> Ok(Vorta)
    "jem'hadar" | "jemhadar" -> Ok(JemHadar)
    _ -> Error("Unknown species: " <> s)
  }
}

pub fn to_hue_var(species: Species) -> String {
  case species {
    Human -> "var(--hue-federation)"
    Bajoran -> "var(--hue-bajoran)"
    Cardassian -> "var(--hue-cardassian)"
    Klingon -> "var(--hue-klingon)"
    Ferengi -> "var(--hue-ferengi)"
    Trill -> "var(--hue-trill)"
    Changeling -> "var(--hue-changeling)"
    Vorta -> "var(--hue-dominion)"
    JemHadar -> "var(--hue-dominion)"
  }
}
