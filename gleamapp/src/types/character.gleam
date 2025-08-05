pub type Character {
  BenjaminSisko
  JakeSisko
  Dax
  KiraNerys
  MilesObrien
  KeikoObrien
  Bashir
  Odo
  Worf
  Quark
  Rom
  Nog
  Winn
  Bareil
  Garak
  Dukat
  Zek
  MichaelEddington
  KasidyYates
  Leeta
  Gowron
  Martok
  Shakaar
  Ziyal
  Damar
  Brunt
  Weyoun
}

pub fn to_string(character: Character) -> String {
  case character {
    BenjaminSisko -> "Benjamin Sisko"
    JakeSisko -> "Jake Sisko"
    Dax -> "Dax"
    KiraNerys -> "Kira Nerys"
    MilesObrien -> "Miles O'Brien"
    KeikoObrien -> "Keiko O'Brien"
    Bashir -> "Bashir"
    Odo -> "Odo"
    Worf -> "Worf"
    Quark -> "Quark"
    Rom -> "Rom"
    Nog -> "Nog"
    Winn -> "Winn"
    Bareil -> "Bareil"
    Garak -> "Garak"
    Dukat -> "Dukat"
    Zek -> "Zek"
    MichaelEddington -> "Michael Eddington"
    KasidyYates -> "Kasidy Yates"
    Leeta -> "Leeta"
    Gowron -> "Gowron"
    Martok -> "Martok"
    Shakaar -> "Shakaar"
    Ziyal -> "Ziyal"
    Damar -> "Damar"
    Brunt -> "Brunt"
    Weyoun -> "Weyoun"
  }
}

pub fn from_string(s: String) -> Result(Character, String) {
  case s {
    "Benjamin Sisko" -> Ok(BenjaminSisko)
    "Jake Sisko" -> Ok(JakeSisko)
    "Dax" -> Ok(Dax)
    "Kira Nerys" -> Ok(KiraNerys)
    "Miles O'Brien" -> Ok(MilesObrien)
    "Keiko O'Brien" -> Ok(KeikoObrien)
    "Bashir" -> Ok(Bashir)
    "Odo" -> Ok(Odo)
    "Worf" -> Ok(Worf)
    "Quark" -> Ok(Quark)
    "Rom" -> Ok(Rom)
    "Nog" -> Ok(Nog)
    "Winn" -> Ok(Winn)
    "Bareil" -> Ok(Bareil)
    "Garak" -> Ok(Garak)
    "Dukat" -> Ok(Dukat)
    "Zek" -> Ok(Zek)
    "Michael Eddington" -> Ok(MichaelEddington)
    "Kasidy Yates" -> Ok(KasidyYates)
    "Leeta" -> Ok(Leeta)
    "Gowron" -> Ok(Gowron)
    "Martok" -> Ok(Martok)
    "Shakaar" -> Ok(Shakaar)
    "Ziyal" -> Ok(Ziyal)
    "Damar" -> Ok(Damar)
    "Brunt" -> Ok(Brunt)
    "Weyoun" -> Ok(Weyoun)
    _ -> Error("Unknown character: " <> s)
  }
}

pub fn image_hue(character: Character) -> Int {
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

  case character {
    BenjaminSisko -> command
    JakeSisko -> federation
    Dax -> science_or_medical
    KiraNerys -> bajoran
    MilesObrien -> engineering_or_security
    KeikoObrien -> federation
    Bashir -> science_or_medical
    Odo -> bajoran_security
    Worf -> command
    Quark -> ferengi
    Rom -> ferengi
    Nog -> ferengi
    Winn -> bajoran
    Bareil -> bajoran
    Garak -> cardassian
    Dukat -> cardassian
    Zek -> ferengi
    MichaelEddington -> engineering_or_security
    KasidyYates -> federation
    Leeta -> bajoran
    Gowron -> klingon
    Martok -> klingon
    Shakaar -> bajoran
    Ziyal -> cardassian
    Damar -> cardassian
    Brunt -> ferengi
    Weyoun -> jem_hadar
  }
}