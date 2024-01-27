module Chart exposing (view)

import Css exposing (..)
import Html.Styled exposing (Html, div, text)
import Html.Styled.Attributes exposing (css)


view : String -> List { a | importance : Int } -> Html msg
view title episodes =
    div
        [ css
            [ property "display" "grid"
            , property "grid-template-columns" "9em 1fr"
            , property "column-gap" "1em"
            , alignItems center
            ]
        ]
        [ div [] [ text title ]
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
            (\ep ->
                div
                    [ css
                        [ width (px 15)
                        , height (px 15)
                        , borderRadius (px 1)
                        , property "background-color" (color ep)
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
