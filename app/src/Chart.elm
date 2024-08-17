module Chart exposing (colorString, coloredCell, stepByImportance, view)

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


colorString : { hue : Int, lightness : Int } -> String
colorString { hue, lightness } =
    "hsl(" ++ String.fromInt hue ++ ", 80%, " ++ String.fromInt lightness ++ "%)"


histogram : { color : a -> String } -> List a -> Html msg
histogram { color } episodes =
    div
        [ css
            [ property "padding-inline" "0.5em"
            , property "display" "grid"
            , property "grid-auto-flow" "column"
            , property "grid-auto-columns" "8px"
            , property "grid-template-rows" "repeat(5, 8px)"
            , property "gap" "2px"
            , firstChild
                [ property "padding-inline-start" "0" ]
            , nthChild "n+2"
                [ borderLeft3 (px 1) solid (hsl 0 0 0) ]
            , lastChild
                [ property "padding-inline-end" "0" ]
            ]
        ]
        (List.map (\ep -> coloredCell (color ep)) episodes)


coloredCell : String -> Html msg
coloredCell backgroundColor =
    div
        [ css
            [ width (pct 100)
            , height (pct 100)
            , borderRadius (pct 10)
            , property "background-color" backgroundColor
            ]
        ]
        []


stepByImportance : Int -> Int
stepByImportance importance =
    if importance == 5 then
        80

    else if importance == 4 then
        60

    else if importance == 3 then
        30

    else if importance == 2 then
        17

    else if importance == 1 then
        10

    else
        0
