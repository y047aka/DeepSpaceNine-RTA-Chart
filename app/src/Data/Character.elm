module Data.Character exposing (Character(..), toString)


type Character
    = BenjaminSisko
    | JakeSisko
    | Dax
    | KiraNerys
    | MilesObrien
    | KeikoObrien
    | Bashir
    | Odo
    | Worf
    | Quark
    | Rom
    | Nog
    | Winn
    | Bareil
    | Garak
    | Dukat
    | Zek
    | MichaelEddington
    | KasidyYates
    | Leeta
    | Gowron
    | Martok
    | Shakaar
    | Ziyal
    | Damar
    | Brunt
    | Weyoun


toString : Character -> String
toString c =
    case c of
        BenjaminSisko ->
            "Benjamin Sisko"

        JakeSisko ->
            "Jake Sisko"

        Dax ->
            "Dax"

        KiraNerys ->
            "Kira Nerys"

        MilesObrien ->
            "Miles O'Brien"

        KeikoObrien ->
            "Keiko O'Brien"

        Bashir ->
            "Bashir"

        Odo ->
            "Odo"

        Worf ->
            "Worf"

        Quark ->
            "Quark"

        Rom ->
            "Rom"

        Nog ->
            "Nog"

        Winn ->
            "Winn"

        Bareil ->
            "Bareil"

        Garak ->
            "Garak"

        Dukat ->
            "Dukat"

        Zek ->
            "Zek"

        MichaelEddington ->
            "Michael Eddington"

        KasidyYates ->
            "Kasidy Yates"

        Leeta ->
            "Leeta"

        Gowron ->
            "Gowron"

        Martok ->
            "Martok"

        Shakaar ->
            "Shakaar"

        Ziyal ->
            "Ziyal"

        Damar ->
            "Damar"

        Brunt ->
            "Brunt"

        Weyoun ->
            "Weyoun"
