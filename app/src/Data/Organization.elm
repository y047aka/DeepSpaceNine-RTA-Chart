module Data.Organization exposing (Organization(..), fromString, imageHue, toString)


type Organization
    = Federation
    | Trill
    | Bajor
    | Prophet
    | Cardassia
    | Ferengi
    | Klingon
    | Maquis
    | Dominion
    | MirrorUniverse


toString : Organization -> String
toString c =
    case c of
        Federation ->
            "Federation"

        Trill ->
            "Trill"

        Bajor ->
            "Bajor"

        Prophet ->
            "Prophet"

        Cardassia ->
            "Cardassia"

        Ferengi ->
            "Ferengi"

        Klingon ->
            "Klingon"

        Maquis ->
            "Maquis"

        Dominion ->
            "Dominion"

        MirrorUniverse ->
            "Mirror Universe"


fromString : String -> Maybe Organization
fromString s =
    case s of
        "Federation" ->
            Just Federation

        "Trill" ->
            Just Trill

        "Bajor" ->
            Just Bajor

        "Prophet" ->
            Just Prophet

        "Cardassia" ->
            Just Cardassia

        "Ferengi" ->
            Just Ferengi

        "Klingon" ->
            Just Klingon

        "Maquis" ->
            Just Maquis

        "Dominion" ->
            Just Dominion

        "Mirror Universe" ->
            Just MirrorUniverse

        _ ->
            Nothing


imageHue : Organization -> Int
imageHue c =
    let
        command =
            350

        scienceOrMedical =
            190

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

        dominion =
            270
    in
    case c of
        Federation ->
            federation

        Trill ->
            scienceOrMedical

        Bajor ->
            bajoran

        Prophet ->
            bajoran

        Cardassia ->
            cardassian

        Ferengi ->
            ferengi

        Klingon ->
            klingon

        Maquis ->
            command

        Dominion ->
            dominion

        MirrorUniverse ->
            command
