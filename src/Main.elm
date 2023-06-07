module Main exposing (main)

import Browser
import Chart
import Css exposing (..)
import Css.Global exposing (children, global)
import Css.Transitions exposing (transition)
import Data.Character as Character exposing (Character(..))
import Data.Episode exposing (Episode, episodesDecoder)
import Dict
import Html.Styled as Html exposing (Html, a, div, input, label, td, text, toUnstyled, tr)
import Html.Styled.Attributes as Attributes exposing (css, href, type_)
import Html.Styled.Events exposing (onClick)
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
    { episodes : List Episode
    , afterSeason4 : Bool
    }


init : Json.Decode.Value -> ( Model, Cmd Msg )
init json =
    ( { episodes =
            Json.Decode.decodeValue episodesDecoder json
                |> Result.withDefault []
      , afterSeason4 = False
      }
    , Cmd.none
    )



-- UPDATE


type Msg
    = Toggle


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Toggle ->
            ( { model | afterSeason4 = not model.afterSeason4 }, Cmd.none )



-- VIEW


view : Model -> Html Msg
view { episodes, afterSeason4 } =
    let
        characters_ =
            config afterSeason4
    in
    div []
        [ global [ Css.Global.body [ backgroundColor (hsl 0 0 0.1), color (hsl 0 0 0.6) ] ]
        , Chart.view episodes
        , label [ css [ display block, marginLeft auto, maxWidth maxContent, fontSize (px 14) ] ]
            [ input [ type_ "checkbox", Attributes.checked afterSeason4, onClick Toggle ] []
            , text "Show characters after season 4"
            ]
        , Html.table [ css [ margin2 zero auto, borderCollapse collapse ] ] <|
            List.indexedMap (episodeView characters_) episodes
        ]


config : Bool -> { characters : List Character }
config afterSeason4 =
    { characters =
        [ BenjaminSisko, JakeSisko, Dax, KiraNerys, MilesObrien, KeikoObrien, Bashir, Odo, Quark, Rom, Nog, Winn, Bareil, Garak, Dukat ]
            ++ (if afterSeason4 then
                    [ MichaelEddington, KasidyYates, Leeta, Worf, Gowron, Martok, Shakaar, Ziyal, Damar ]

                else
                    []
               )
    }


episodeView : { characters : List Character } -> Int -> Episode -> Html msg
episodeView config_ index ep =
    tr
        [ css
            [ height (px 31)
            , fontSize (px 10)
            , color (hsl 0 0 (stepByImportance ep.importance))
            , nthChild "odd"
                [ backgroundColor (hsl 0 0 0.095) ]
            , transition
                [ Css.Transitions.backgroundColor 500 ]
            , children
                [ Css.Global.td [ padding2 (px 5) (px 6) ] ]
            , hover [ backgroundColor (hsl 0 0 0.15) ]
            ]
        ]
        (epSummaryColumns index ep
            ++ epCharacterColumns config_ ep
            ++ [ td [] [ netflixLink ep.netflix_id ] ]
        )


epSummaryColumns : Int -> Episode -> List (Html msg)
epSummaryColumns index { season, episode, title, title_ja, importance } =
    [ td [ css [ textAlign center, fontSize (px 12) ] ] [ text <| String.fromInt (index + 1) ]
    , td [ css [ minWidth (em 4.5), textAlign center ] ]
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
        [ div [ css [ fontSize (px 12) ] ] [ text title ]
        , div [ css [ color (hsl 0 0 0.4) ] ] [ text title_ja ]
        ]
    ]


epCharacterColumns : { characters : List Character } -> Episode -> List (Html msg)
epCharacterColumns config_ ep =
    let
        characterDict =
            ep.characters
                |> List.map (\{ name, contrast } -> ( name, contrast ))
                |> Dict.fromList
    in
    List.map
        (\character ->
            Dict.get (Character.toString character) characterDict
                |> Maybe.map (\contrast -> td [ css [ color (hsl 0 0 (stepByImportance contrast)) ] ] [ text (Character.toString character) ])
                |> Maybe.withDefault (td [] [])
        )
        config_.characters


netflixLink : Int -> Html msg
netflixLink netflix_id =
    a
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


stepByImportance : Int -> Float
stepByImportance importance =
    if importance > 3 then
        0.8
        -- importance |> toFloat |> (*) 0.15

    else if importance > 2 then
        0.5

    else
        0.3
