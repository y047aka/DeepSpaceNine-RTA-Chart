module Chart exposing (view)

import Css exposing (..)
import Html.Styled exposing (Html, div, text)
import Html.Styled.Attributes exposing (css)
import List.Extra


view : String -> Int -> List { a | season : Int, importance : Int } -> Html msg
view title hue episodes =
    div
        [ css
            [ displayFlex
            , flexDirection column
            , alignItems start
            , property "row-gap" "0.5em"
            ]
        ]
        [ div [ css [ fontSize (px 14) ] ] [ text title ]
        , div
            [ css
                [ property "display" "grid"
                , property "grid-template-columns" "repeat(7, auto)"
                ]
            ]
            (List.Extra.gatherEqualsBy .season episodes
                |> List.map (\( head, tails ) -> head :: tails)
                |> List.map (histogram { color = \{ importance } -> "hsl(" ++ String.fromInt hue ++ ", 80%, " ++ stepByImportance importance ++ ")" })
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
            , property "gap" "2px"
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
                        [ width (px 8)
                        , height (px 8)
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
    )
        ++ "%"
