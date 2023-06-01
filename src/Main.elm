module Main exposing (main)

import Browser
import Chart
import Css exposing (..)
import Css.Global exposing (children, global)
import Css.Transitions exposing (transition)
import Episode exposing (Character, Episode, episodesDecoder)
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
        { benjaminSisko, odo, bashir, dax, jakeSisko, milesObrien, quark, kiraNerys, keikoObrien, garak, dukat, rom, nog, bareil, winn } =
            fromCharacters characters

        charactersContrastColumns =
            [ benjaminSisko, odo, bashir, dax, jakeSisko, milesObrien, quark, kiraNerys, keikoObrien, garak, dukat, rom, nog, bareil, winn ]
                |> List.map
                    (\maybeCharacter ->
                        maybeCharacter
                            |> Maybe.map (\( name, contrast ) -> td [ css [ color (hsl 0 0 (stepByImportance contrast)) ] ] [ text name ])
                            |> Maybe.withDefault (td [] [])
                    )
    in
    tr
        [ css
            [ height (px 31)
            , fontSize (px 10)
            , color (hsl 0 0 (stepByImportance importance))
            , children
                [ Css.Global.td [ padding2 (px 5) (px 6) ] ]
            , transition [ Css.Transitions.backgroundColor 150 ]
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


fromCharacters :
    List Character
    ->
        { benjaminSisko : Maybe ( String, Int )
        , odo : Maybe ( String, Int )
        , bashir : Maybe ( String, Int )
        , dax : Maybe ( String, Int )
        , jakeSisko : Maybe ( String, Int )
        , milesObrien : Maybe ( String, Int )
        , quark : Maybe ( String, Int )
        , kiraNerys : Maybe ( String, Int )
        , keikoObrien : Maybe ( String, Int )
        , garak : Maybe ( String, Int )
        , dukat : Maybe ( String, Int )
        , rom : Maybe ( String, Int )
        , nog : Maybe ( String, Int )
        , bareil : Maybe ( String, Int )
        , winn : Maybe ( String, Int )
        }
fromCharacters =
    List.foldl
        (\{ name, contrast } r ->
            case name of
                "Benjamin Sisko" ->
                    { r | benjaminSisko = Just ( name, contrast ) }

                "Odo" ->
                    { r | odo = Just ( name, contrast ) }

                "Bashir" ->
                    { r | bashir = Just ( name, contrast ) }

                "Dax" ->
                    { r | dax = Just ( name, contrast ) }

                "Jake Sisko" ->
                    { r | jakeSisko = Just ( name, contrast ) }

                "Miles O'Brien" ->
                    { r | milesObrien = Just ( name, contrast ) }

                "Quark" ->
                    { r | quark = Just ( name, contrast ) }

                "Kira Nerys" ->
                    { r | kiraNerys = Just ( name, contrast ) }

                "Keiko O'Brien" ->
                    { r | keikoObrien = Just ( name, contrast ) }

                "Garak" ->
                    { r | garak = Just ( name, contrast ) }

                "Dukat" ->
                    { r | dukat = Just ( name, contrast ) }

                "Rom" ->
                    { r | rom = Just ( name, contrast ) }

                "Nog" ->
                    { r | nog = Just ( name, contrast ) }

                "Bareil" ->
                    { r | bareil = Just ( name, contrast ) }

                "Winn" ->
                    { r | winn = Just ( name, contrast ) }

                _ ->
                    r
        )
        { benjaminSisko = Nothing
        , odo = Nothing
        , bashir = Nothing
        , dax = Nothing
        , jakeSisko = Nothing
        , milesObrien = Nothing
        , quark = Nothing
        , kiraNerys = Nothing
        , keikoObrien = Nothing
        , garak = Nothing
        , dukat = Nothing
        , rom = Nothing
        , nog = Nothing
        , bareil = Nothing
        , winn = Nothing
        }


stepByImportance : Int -> Float
stepByImportance importance =
    if importance > 3 then
        0.8
        -- importance |> toFloat |> (*) 0.15

    else if importance > 2 then
        0.5

    else
        0.3
