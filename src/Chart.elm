module Chart exposing (view)

import Css exposing (block, color, display, displayFlex, hsl)
import Episode exposing (Episode)
import Html.Styled exposing (Html)
import Html.Styled.Attributes exposing (css)
import Scale exposing (ContinuousScale)
import Svg.Styled as Svg exposing (Svg, g, polyline, svg, text)
import TypedSvg.Styled.Attributes exposing (points, viewBox)
import TypedSvg.Styled.Attributes.InPx exposing (height, width)


w : Float
w =
    1600


h : Float
h =
    w * (5 / 16)


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
        , css
            [ display block
            , color (hsl 175 0.6 0.5)
            ]
        ]
        [ episodes |> List.indexedMap (\i { importance } -> ( (toFloat >> Scale.convert xScale) i, (toFloat >> Scale.convert yScale) importance )) |> polyline_
        , episodesView episodes
        ]


episodesView : List Episode -> Svg msg
episodesView episodes =
    g [ css [ displayFlex ] ] <|
        List.map
            (\{ importance } ->
                g []
                    [ text (String.fromInt importance) ]
            )
            episodes


polyline_ : List ( Float, Float ) -> Svg msg
polyline_ points_ =
    polyline [ css [ Css.property "stroke" (hsl 175 0.6 0.5).value ], points points_ ] []
