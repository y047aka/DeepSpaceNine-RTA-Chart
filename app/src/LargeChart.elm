module LargeChart exposing (view)

import Chart exposing (colorString, stepByImportance)
import Css exposing (..)
import Html.Styled exposing (Html, div)
import Html.Styled.Attributes exposing (css)
import List.Extra


view : Int -> List { a | season : Int, importance : Int } -> Html msg
view hue episodes =
    div
        [ css
            [ property "display" "grid"
            , property "grid-template-columns" "repeat(7, auto)"
            ]
        ]
        (List.Extra.gatherEqualsBy .season episodes
            |> List.map (\( head, tails ) -> histogram { color = \{ importance } -> colorString { hue = hue, lightness = stepByImportance importance } } (head :: tails))
        )


histogram : { color : a -> String } -> List a -> Html msg
histogram { color } episodes =
    div
        [ css
            [ property "padding-inline" "0.5em"
            , property "display" "grid"
            , property "grid-auto-flow" "column"
            , property "grid-template-rows" "repeat(5, auto)"
            , property "gap" "3px"
            , firstChild
                [ property "padding-inline-start" "0" ]
            , nthChild "n+2"
                [ borderLeft3 (px 1) solid (hsl 0 0 0) ]
            , lastChild
                [ property "padding-inline-end" "0" ]
            ]
        ]
    <|
        List.map
            (\ep ->
                div
                    [ css
                        [ width (px 24)
                        , height (px 24)
                        , borderRadius (px 2)
                        , property "background-color" (color ep)
                        ]
                    ]
                    []
            )
            episodes
