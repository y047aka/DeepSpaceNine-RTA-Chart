module Color exposing (Color, hsla, toCssString)


type Color
    = Hsla360 Float Float Float Float


hsla : Float -> Float -> Float -> Float -> Color
hsla hue sat light alpha =
    Hsla360 hue sat light alpha


toCssString : Color -> String
toCssString c =
    let
        pct x =
            ((x * 10000) |> round |> toFloat) / 100

        roundTo x =
            ((x * 1000) |> round |> toFloat) / 1000
    in
    case c of
        Hsla360 h s l alpha ->
            cssColorLevel4 "hsl"
                ( [ String.fromFloat (roundTo h)
                  , String.fromFloat (pct s) ++ "%"
                  , String.fromFloat (pct l) ++ "%"
                  ]
                , String.fromFloat (roundTo alpha)
                )


cssColorLevel4 : String -> ( List String, String ) -> String
cssColorLevel4 funcName ( args, alpha ) =
    let
        slashAndAplha =
            if alpha == "1" then
                []

            else
                [ "/", alpha ]
    in
    funcName
        ++ "("
        ++ String.join " " (args ++ slashAndAplha)
        ++ ")"
