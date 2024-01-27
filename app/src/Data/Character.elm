module Data.Character exposing (Character(..), imageHue, toString)


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


imageHue : Character -> Int
imageHue c =
    let
        command =
            350

        engineeringOrSecurity =
            55

        scienceOrMedical =
            190

        bajoranSecurity =
            45

        federation =
            220

        bajoran =
            10

        cardassian =
            175

        klingon =
            120

        ferengi =
            25

        jemHadar =
            270
    in
    case c of
        BenjaminSisko ->
            command

        JakeSisko ->
            federation

        Dax ->
            scienceOrMedical

        KiraNerys ->
            bajoran

        MilesObrien ->
            engineeringOrSecurity

        KeikoObrien ->
            federation

        Bashir ->
            scienceOrMedical

        Odo ->
            bajoranSecurity

        Worf ->
            command

        Quark ->
            ferengi

        Rom ->
            ferengi

        Nog ->
            ferengi

        Winn ->
            bajoran

        Bareil ->
            bajoran

        Garak ->
            cardassian

        Dukat ->
            cardassian

        Zek ->
            ferengi

        MichaelEddington ->
            engineeringOrSecurity

        KasidyYates ->
            federation

        Leeta ->
            bajoran

        Gowron ->
            klingon

        Martok ->
            klingon

        Shakaar ->
            bajoran

        Ziyal ->
            cardassian

        Damar ->
            cardassian

        Brunt ->
            ferengi

        Weyoun ->
            jemHadar
