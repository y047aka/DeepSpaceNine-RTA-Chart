module Chart exposing (view)

import Css exposing (block, display, hsl)
import Data.Episode exposing (Episode)
import Html.Styled exposing (Html)
import Scale exposing (ContinuousScale)
import Svg.Styled exposing (Svg, g, rect, svg)
import Svg.Styled.Attributes exposing (css, fill)
import TypedSvg.Styled.Attributes exposing (viewBox)
import TypedSvg.Styled.Attributes.InPx as InPx exposing (height, width)


w : Float
w =
    1200


h : Float
h =
    20


padding : Float
padding =
    20


xScale : ContinuousScale Float
xScale =
    Scale.linear ( padding, w - padding ) ( 0, 180 )


yScale : ContinuousScale Float
yScale =
    Scale.linear ( padding, h - padding ) ( 5, 0 )


view : List Episode -> Html msg
view episodes =
    svg
        [ width w
        , height h
        , viewBox 0 0 w h
        , css [ display block ]
        ]
        [ histogram_
            { x = toFloat >> Scale.convert xScale
            , y = always 10
            , width = always 1
            , color = \{ importance } -> "hsl(0, 0%, " ++ stepByImportance importance ++ ")"
            }
            episodes
        ]


histogram_ :
    { x : Int -> Float, y : a -> Float, width : a -> Float, color : a -> String }
    -> List a
    -> Svg msg
histogram_ { x, y, width, color } laps =
    g [] <|
        List.indexedMap
            (\index lap ->
                rect
                    [ InPx.x (x index - 1)
                    , InPx.y (y lap - 10)
                    , InPx.width (width lap)
                    , InPx.height 20
                    , fill (color lap)
                    ]
                    []
            )
            laps


stepByImportance : Int -> String
stepByImportance importance =
    if importance > 3 then
        "80%"

    else if importance > 2 then
        "50%"

    else
        "30%"
