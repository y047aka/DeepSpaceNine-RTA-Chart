module TypedSvg.Styled.TypesToStrings exposing (lengthToString)

import TypedSvg.Types exposing (Length(..))


lengthToString : Length -> String
lengthToString length =
    case length of
        Cm x ->
            String.fromFloat x ++ "cm"

        Em x ->
            String.fromFloat x ++ "em"

        Ex x ->
            String.fromFloat x ++ "ex"

        In x ->
            String.fromFloat x ++ "in"

        Mm x ->
            String.fromFloat x ++ "mm"

        Num x ->
            String.fromFloat x

        Pc x ->
            String.fromFloat x ++ "pc"

        Percent x ->
            String.fromFloat x ++ "%"

        Pt x ->
            String.fromFloat x ++ "pt"

        Px x ->
            String.fromFloat x ++ "px"

        Rem x ->
            String.fromFloat x ++ "rem"
