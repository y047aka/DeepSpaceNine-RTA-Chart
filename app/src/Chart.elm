module Chart exposing (view)

import Css exposing (..)
import Html.Styled exposing (Html, div, text)
import Html.Styled.Attributes exposing (css)
import List.Extra


view : String -> List { a | season : Int, importance : Int } -> Html msg
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
        , div
            [ css
                [ property "display" "grid"
                , property "grid-template-columns" "repeat(7, auto)"
                ]
            ]
            (List.Extra.gatherEqualsBy .season episodes
                |> List.map (\( head, tails ) -> head :: tails)
                |> List.map (histogram { color = \{ importance } -> "hsl(0, 0%, " ++ stepByImportance importance ++ ")" })
            )
        ]


histogram : { color : a -> String } -> List a -> Html msg
histogram { color } episodes =
    div
        [ css
            [ property "padding-inline" "0.5em"
            , property "display" "grid"
            , property "grid-auto-flow" "column"
            , property "grid-template-rows" "repeat(5, auto)"
            , property "gap" "5px"
            , nthChild "n+2"
                [ borderLeft3 (px 1) solid (hsl 0 0 0) ]
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
            episodes


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
