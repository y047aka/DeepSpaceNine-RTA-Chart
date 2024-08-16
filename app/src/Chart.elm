module Chart exposing (cell, colorString, stepByImportance, view)

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
            , property "grid-template-rows" "repeat(5, auto)"
            , property "gap" "2px"
            , firstChild
                [ property "padding-inline-start" "0" ]
            , nthChild "n+2"
                [ borderLeft3 (px 1) solid (hsl 0 0 0) ]
            , lastChild
                [ property "padding-inline-end" "0" ]
            ]
        ]
        (List.map
            (\ep ->
                cell
                    { size = px 8
                    , borderRadius = px 1
                    , backgroundColor = color ep
                    }
            )
            episodes
        )


cell :
    { size : Px
    , borderRadius : Px
    , backgroundColor : String
    }
    -> Html msg
cell ps =
    div
        [ css
            [ width ps.size
            , height ps.size
            , borderRadius ps.borderRadius
            , property "background-color" ps.backgroundColor
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
