module Chart.Histogram exposing (coloredCell, stepByImportance, view)

import Color exposing (Color)
import Css exposing (borderLeft3, borderRadius, firstChild, height, hsl, lastChild, nthChild, pct, property, px, solid, width)
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
            [ property "padding-inline" "0.3vw"
            , property "display" "grid"
            , property "grid-auto-flow" "column"
            , property "grid-auto-columns" "max(5px, 0.4vw)"
            , property "grid-template-rows" "repeat(5, max(5px, 0.4vw))"
            , property "gap" "max(1.5px, 0.1vw)"
            , firstChild
                [ property "padding-inline-start" "0" ]
            , nthChild "n+2"
                [ borderLeft3 (px 1) solid (hsl 0 0 0) ]
            , lastChild
                [ property "padding-inline-end" "0" ]
            ]
        ]
        (List.map (\ep -> coloredCell (toColor ep)) episodes)


coloredCell : Color -> Html msg
coloredCell backgroundColor =
    div
        [ css
            [ width (pct 100)
            , height (pct 100)
            , borderRadius (pct 10)
            , property "background-color" (Color.toCssString backgroundColor)
            ]
        ]
        []


stepByImportance : Int -> Float
stepByImportance importance =
    if importance == 5 then
        0.8

    else if importance == 4 then
        0.6

    else if importance == 3 then
        0.3

    else if importance == 2 then
        0.17

    else if importance == 1 then
        0.1

    else
        0
