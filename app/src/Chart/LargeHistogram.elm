module Chart.LargeHistogram exposing (view)

import Chart.Histogram exposing (coloredCell, stepByImportance)
import Color exposing (Color)
import Css exposing (borderLeft3, firstChild, hsl, lastChild, nthChild, property, px, solid)
import Html.Styled exposing (Html, div)
import Html.Styled.Attributes exposing (css)
import List.Extra


view : Int -> List { a | season : Int, importance : Int } -> Html msg
view hue episodes =
    let
        toColor { importance } =
            Color.hsla (toFloat hue) 0.8 (stepByImportance importance) 1
    in
    div
        [ css
            [ property "display" "grid"
            , property "grid-template-columns" "repeat(7, auto)"
            ]
        ]
        (List.Extra.gatherEqualsBy .season episodes
            |> List.map (\( head, tails ) -> histogram toColor (head :: tails))
        )


histogram : (a -> Color) -> List a -> Html msg
histogram toColor episodes =
    div
        [ css
            [ property "padding-inline" "0.5em"
            , property "display" "grid"
            , property "grid-auto-flow" "column"
            , property "grid-auto-columns" "max(16px, 1.2vw)"
            , property "grid-template-rows" "repeat(5, max(16px, 1.2vw))"
            , property "gap" "3px"
            , firstChild
                [ property "padding-inline-start" "0" ]
            , nthChild "n+2"
                [ borderLeft3 (px 1) solid (hsl 0 0 0) ]
            , lastChild
                [ property "padding-inline-end" "0" ]
            ]
        ]
        (List.map (\ep -> coloredCell (toColor ep)) episodes)
