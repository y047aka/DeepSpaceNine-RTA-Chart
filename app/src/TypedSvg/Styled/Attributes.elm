module TypedSvg.Styled.Attributes exposing (points, viewBox)

import Svg.Styled exposing (Attribute)
import Svg.Styled.Attributes as Attributes


points : List ( Float, Float ) -> Attribute msg
points pts =
    let
        pointToString ( xx, yy ) =
            String.fromFloat xx ++ ", " ++ String.fromFloat yy
    in
    Attributes.points <| String.join " " (List.map pointToString pts)


viewBox : Float -> Float -> Float -> Float -> Attribute a
viewBox minX minY vWidth vHeight =
    [ minX, minY, vWidth, vHeight ]
        |> List.map String.fromFloat
        |> String.join " "
        |> Attributes.viewBox
