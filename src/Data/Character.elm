module Data.Character exposing (Character(..), fromString, toString)


type Character
    = BenjaminSisko
    | Odo
    | Bashir
    | Dax
    | JakeSisko
    | MilesObrien
    | Quark
    | KiraNerys
    | KeikoObrien
    | Garak
    | Dukat
    | Rom
    | Nog
    | Bareil
    | Winn


fromString : String -> Maybe Character
fromString s =
    case s of
        "Benjamin Sisko" ->
            Just BenjaminSisko

        "Odo" ->
            Just Odo

        "Bashir" ->
            Just Bashir

        "Dax" ->
            Just Dax

        "Jake Sisko" ->
            Just JakeSisko

        "Miles O'Brien" ->
            Just MilesObrien

        "Quark" ->
            Just Quark

        "Kira Nerys" ->
            Just KiraNerys

        "Keiko O'Brien" ->
            Just KeikoObrien

        "Garak" ->
            Just Garak

        "Dukat" ->
            Just Dukat

        "Rom" ->
            Just Rom

        "Nog" ->
            Just Nog

        "Bareil" ->
            Just Bareil

        "Winn" ->
            Just Winn

        _ ->
            Nothing


toString : Character -> String
toString c =
    case c of
        BenjaminSisko ->
            "Benjamin Sisko"

        Odo ->
            "Odo"

        Bashir ->
            "Bashir"

        Dax ->
            "Dax"

        JakeSisko ->
            "Jake Sisko"

        MilesObrien ->
            "Miles O'Brien"

        Quark ->
            "Quark"

        KiraNerys ->
            "Kira Nerys"

        KeikoObrien ->
            "Keiko O'Brien"

        Garak ->
            "Garak"

        Dukat ->
            "Dukat"

        Rom ->
            "Rom"

        Nog ->
            "Nog"

        Bareil ->
            "Bareil"

        Winn ->
            "Winn"
