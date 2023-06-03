module Data.Character exposing (Character(..), fromString, toString)


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


fromString : String -> Maybe Character
fromString s =
    case s of
        "Benjamin Sisko" ->
            Just BenjaminSisko

        "Jake Sisko" ->
            Just JakeSisko

        "Dax" ->
            Just Dax

        "Kira Nerys" ->
            Just KiraNerys

        "Miles O'Brien" ->
            Just MilesObrien

        "Keiko O'Brien" ->
            Just KeikoObrien

        "Bashir" ->
            Just Bashir

        "Odo" ->
            Just Odo

        "Worf" ->
            Just Worf

        "Quark" ->
            Just Quark

        "Rom" ->
            Just Rom

        "Nog" ->
            Just Nog

        "Winn" ->
            Just Winn

        "Bareil" ->
            Just Bareil

        "Garak" ->
            Just Garak

        "Dukat" ->
            Just Dukat

        "Zek" ->
            Just Zek

        "Michael Eddington" ->
            Just MichaelEddington

        "Kasidy Yates" ->
            Just KasidyYates

        "Leeta" ->
            Just Leeta

        "Gowron" ->
            Just Gowron

        "Martok" ->
            Just Martok

        "Shakaar" ->
            Just Shakaar

        "Ziyal" ->
            Just Ziyal

        "Damar" ->
            Just Damar

        "Brunt" ->
            Just Brunt

        "Weyoun" ->
            Just Weyoun

        _ ->
            Nothing


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
