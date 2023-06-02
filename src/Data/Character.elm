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
    | Quark
    | Rom
    | Nog
    | Winn
    | Bareil
    | Garak
    | Dukat


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
