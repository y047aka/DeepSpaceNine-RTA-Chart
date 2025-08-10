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
  Vulcan
  Andorian
  Betazoid
  ElAurian
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
    Vulcan -> "Vulcan"
    Andorian -> "Andorian"
    Betazoid -> "Betazoid"
    ElAurian -> "El-Aurian"
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
    "vulcan" -> Ok(Vulcan)
    "andorian" -> Ok(Andorian)
    "betazoid" -> Ok(Betazoid)
    "el-aurian" | "elaurian" -> Ok(ElAurian)
    _ -> Error("Unknown species: " <> s)
  }
}
