module Main exposing (main)

import AssocList as Dict
import Browser
import Chart
import Css exposing (..)
import Css.Global exposing (children, global)
import Css.Transitions exposing (transition)
import Data.Character as Character exposing (Character(..))
import Data.Episode exposing (Episode, episodesDecoder)
import Html.Styled as Html exposing (Html, a, div, td, text, toUnstyled, tr)
import Html.Styled.Attributes as Attributes exposing (css, href)
import Json.Decode


main : Program Json.Decode.Value Model Msg
main =
    Browser.element
        { init = init
        , update = update
        , view = view >> toUnstyled
        , subscriptions = \_ -> Sub.none
        }



-- MODEL


type alias Model =
    { episodes : List Episode }


init : Json.Decode.Value -> ( Model, Cmd Msg )
init json =
    ( { episodes =
            Json.Decode.decodeValue episodesDecoder json
                |> Result.withDefault []
      }
    , Cmd.none
    )



-- UPDATE


type alias Msg =
    {}


update : Msg -> Model -> ( Model, Cmd Msg )
update _ model =
    ( model, Cmd.none )



-- VIEW


view : Model -> Html Msg
view { episodes } =
    div []
        [ global [ Css.Global.body [ backgroundColor (hsl 0 0 0.1) ] ]
        , Chart.view episodes
        , Html.table [ css [ margin2 zero auto, borderCollapse collapse ] ] <|
            List.indexedMap episodeView episodes
        ]


episodeView : Int -> Episode -> Html msg
episodeView index { season, episode, title, title_ja, importance, netflix_id, characters } =
    let
        characterDict =
            characters
                |> List.filterMap
                    (\{ name, contrast } ->
                        Character.fromString name
                            |> Maybe.map (\character -> ( character, contrast ))
                    )
                |> Dict.fromList

        charactersContrastColumns =
            [ [ BenjaminSisko, JakeSisko, Dax, KiraNerys, MilesObrien, KeikoObrien, Bashir, Odo, Quark, Rom, Nog, Winn, Bareil, Garak, Dukat ]
            , [ MichaelEddington, KasidyYates, Leeta, Gowron, Martok, Shakaar, Ziyal, Damar ]
            ]
                |> List.concat
                |> List.map
                    (\character ->
                        Dict.get character characterDict
                            |> Maybe.map (\contrast -> td [ css [ color (hsl 0 0 (stepByImportance contrast)) ] ] [ text (Character.toString character) ])
                            |> Maybe.withDefault (td [] [])
                    )
    in
    tr
        [ css
            [ height (px 31)
            , fontSize (px 10)
            , color (hsl 0 0 (stepByImportance importance))
            , nthChild "odd"
                [ backgroundColor (hsl 0 0 0.095) ]
            , transition
                [ Css.Transitions.backgroundColor 500 ]
            , children
                [ Css.Global.td [ padding2 (px 5) (px 6) ] ]
            , hover [ backgroundColor (hsl 0 0 0.15) ]
            ]
        ]
    <|
        [ td [ css [ textAlign center, fontSize (px 12) ] ] [ text <| String.fromInt (index + 1) ]
        , td [ css [ textAlign center ] ]
            [ text <| "S" ++ String.fromInt season ++ " - E" ++ String.fromInt episode ]
        , td
            [ css
                [ before
                    [ property "content" "''"
                    , display block
                    , margin auto
                    , width <| px (toFloat importance * 5 - 2)
                    , height <| px (toFloat importance * 5 - 2)
                    , backgroundColor currentColor
                    , borderRadius (px 50)
                    ]
                ]
            ]
            []
        , td [ css [ displayFlex, flexDirection column, property "row-gap" "2px" ] ]
            [ div [ css [ fontSize <| px (toFloat importance + 10) ] ] [ text title ]
            , div [ css [ color (hsl 0 0 0.4) ] ] [ text title_ja ]
            ]
        ]
            ++ charactersContrastColumns
            ++ [ td []
                    [ a
                        [ href <| "https://www.netflix.com/watch/" ++ String.fromInt netflix_id
                        , Attributes.target "_blank"
                        , css
                            [ display tableCell
                            , padding2 (px 0) (px 10)
                            , fontSize (px 12)
                            , textDecoration none
                            , backgroundColor (hsl 350 0.5 0.45)
                            , color (hsl 0 0 0.1)
                            , borderRadius (px 15)
                            , visited [ backgroundColor (hsl 350 0.5 0.2) ]
                            ]
                        ]
                        [ text "NETFLIX" ]
                    ]
               ]


stepByImportance : Int -> Float
stepByImportance importance =
    if importance > 3 then
        0.8
        -- importance |> toFloat |> (*) 0.15

    else if importance > 2 then
        0.5

    else
        0.3
