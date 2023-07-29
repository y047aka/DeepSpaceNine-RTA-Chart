module TypedSvg.Styled.Attributes.InPx exposing (height, width, x, y)

import Svg.Styled exposing (Attribute)
import Svg.Styled.Attributes as Attributes
import TypedSvg.Styled.TypesToStrings exposing (lengthToString)
import TypedSvg.Types exposing (px)


x : Float -> Attribute msg
x value =
    Attributes.x <| lengthToString (px value)


y : Float -> Attribute msg
y value =
    Attributes.y <| lengthToString (px value)


height : Float -> Attribute msg
height value =
    Attributes.height <| lengthToString (px value)


width : Float -> Attribute msg
width value =
    Attributes.width <| lengthToString (px value)
