module Chart exposing (view)

import Css exposing (..)
import Data.Episode exposing (Episode)
import Html.Styled exposing (Html, div, text)
import Html.Styled.Attributes exposing (css)


view : List Episode -> Html msg
view episodes =
    div
        [ css
            [ property "display" "grid"
            , property "grid-template-columns" "auto 1fr"
            , property "column-gap" "1em"
            , alignItems center
            ]
        ]
        [ div [] [ text "Deep Space Nine" ]
        , histogram { color = \{ importance } -> "hsl(0, 0%, " ++ stepByImportance importance ++ ")" } episodes
        ]


histogram : { color : a -> String } -> List a -> Html msg
histogram { color } episode =
    div
        [ css
            [ property "display" "grid"
            , property "grid-auto-flow" "column"
            , property "grid-template-rows" "auto auto auto auto auto"
            , property "gap" "8px"
            ]
        ]
    <|
        List.map
            (\lap ->
                div
                    [ css
                        [ width (px 15)
                        , height (px 15)
                        , borderRadius (px 1)
                        , property "background-color" (color lap)
                        ]
                    ]
                    []
            )
            episode


stepByImportance : Int -> String
stepByImportance importance =
    (String.fromInt <|
        if importance == 5 then
            100

        else if importance == 4 then
            70

        else if importance == 3 then
            40

        else if importance == 2 then
            25

        else if importance == 1 then
            15

        else
            0
    )
        ++ "%"
