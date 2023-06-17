module TypedSvg.Styled.Attributes.InPx exposing (height, width)

import Svg.Styled exposing (Attribute)
import Svg.Styled.Attributes as Attributes
import TypedSvg.Styled.TypesToStrings exposing (lengthToString)
import TypedSvg.Types exposing (px)


height : Float -> Attribute msg
height value =
    Attributes.height <| lengthToString (px value)


width : Float -> Attribute msg
width value =
    Attributes.width <| lengthToString (px value)
