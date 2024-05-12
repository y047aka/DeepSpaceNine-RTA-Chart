module Main exposing (main)

import Browser
import Chart
import Css exposing (..)
import Css.Global exposing (children, global)
import Css.Transitions exposing (transition)
import Data.Character as Character exposing (Character(..))
import Data.Episode exposing (Episode, episodesDecoder)
import Html.Styled exposing (Html, a, button, div, input, label, li, td, text, toUnstyled, tr, ul)
import Html.Styled.Attributes as Attributes exposing (attribute, css, href, id, type_)
import Html.Styled.Events exposing (onClick)
import Html.Styled.Keyed as Keyed
import Html.Styled.Lazy exposing (lazy2)
import Json.Decode
import List.Extra
import UI.SortableData as SortableData exposing (Column, Direction(..))


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
    , tableState : SortableData.Model Episode (Html Msg)
    , afterSeason4 : Bool
    }


init : Json.Decode.Value -> ( Model, Cmd Msg )
init json =
    ( { episodes =
            Json.Decode.decodeValue episodesDecoder json
                |> Result.withDefault []
      , tableState = SortableData.init .title columns_
      , afterSeason4 = False
      }
    , Cmd.none
    )


columns_ : List (SortableData.Column Episode (Html msg))
columns_ =
    summaryColumns ++ tagsColumn


summaryColumns : List (SortableData.Column Episode (Html msg))
summaryColumns =
    [ { name = "Season - Episode"
      , view =
            \ep ->
                div [ css [ minWidth (em 4.5), textAlign center ] ]
                    [ text <| "S" ++ String.fromInt ep.season ++ " - E" ++ String.fromInt ep.episode ]
      , sort = .title
      , filter = \query ep -> String.startsWith (String.toLower query) (String.toLower <| String.fromInt ep.season)
      }
    , { name = "Importance"
      , view = importanceCircle
      , sort = .importance >> String.fromInt
      , filter = \query ep -> query == String.fromInt ep.importance
      }
    , { name = "Title"
      , view =
            \ep ->
                div [ css [ displayFlex, flexDirection column, property "row-gap" "2px" ] ]
                    [ div [ css [ fontSize (px 12) ] ] [ text ep.title ]
                    , div [ css [ color (hsl 0 0 0.4) ] ] [ text ep.title_ja ]
                    ]
      , sort = .title
      , filter = \query ep -> String.contains (String.toLower query) (String.toLower <| ep.title ++ ep.title_ja)
      }
    ]


tagsColumn : List (SortableData.Column Episode (Html msg))
tagsColumn =
    List.map
        (\tag ->
            { name = tag
            , view =
                \ep ->
                    if List.member tag ep.tags then
                        div
                            [ css
                                [ fontSize (px 10)
                                , padding (px 5)
                                , borderRadius (px 5)
                                , backgroundColor (hsl 0 0 0.2)
                                , color (hsl 0 0 0.6)
                                ]
                            ]
                            [ text tag ]

                    else
                        text ""
            , sort = always tag
            , filter =
                \query ep ->
                    String.contains (String.toLower query)
                        (String.toLower <| String.join "," ep.tags)
            }
        )
        tags_



-- UPDATE


type Msg
    = TableMsg SortableData.Msg
    | Toggle


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        TableMsg tableMsg ->
            ( { model | tableState = SortableData.update tableMsg model.tableState }, Cmd.none )

        Toggle ->
            ( { model | afterSeason4 = not model.afterSeason4 }, Cmd.none )



-- VIEW


view : Model -> Html Msg
view { episodes, tableState, afterSeason4 } =
    div
        [ css
            [ displayFlex
            , flexDirection column
            , alignItems center
            , property "row-gap" "30px"
            ]
        ]
        [ global
            [ Css.Global.body
                [ margin zero
                , fontFamily sansSerif
                , backgroundColor (hsl 0 0 0.1)
                , color (hsl 0 0 0.6)
                ]
            ]
        , label [ css [ display block, marginLeft auto, maxWidth maxContent, fontSize (px 14) ] ]
            [ input [ type_ "checkbox", Attributes.checked afterSeason4, onClick Toggle ] []
            , text "Show more characters"
            ]
        , histogramsSection
            ({ title = "Deep Space Nine", imageHue = 175, episodes = List.map (\{ season, importance } -> { season = season, importance = importance }) episodes }
                :: List.map
                    (\c ->
                        { title = Character.toString c
                        , imageHue = Character.imageHue c
                        , episodes = importanceListOf c episodes
                        }
                    )
                    (config afterSeason4 |> .characters)
            )
        , histogramsSection
            (List.map
                (\tag ->
                    { title = tag
                    , imageHue = 175
                    , episodes =
                        List.map
                            (\ep ->
                                { season = ep.season
                                , importance =
                                    List.Extra.find ((==) tag) ep.tags
                                        |> Maybe.map (\_ -> 4)
                                        |> Maybe.withDefault 0
                                }
                            )
                            episodes
                    }
                )
                tags_
            )
        , chartSelector tags_
        , table tableState (episodes |> SortableData.render tableState)
        ]


histogramsSection : List { title : String, imageHue : Int, episodes : List { season : Int, importance : Int } } -> Html Msg
histogramsSection items =
    div
        [ css
            [ property "display" "grid"
            , property "grid-template-columns" "repeat(3, 1fr)"
            , property "gap" "40px 60px"
            ]
        ]
        (List.map (\{ title, imageHue, episodes } -> Chart.view title imageHue episodes) items)


importanceListOf : Character -> List Episode -> List { season : Int, importance : Int }
importanceListOf character episodes =
    List.map
        (\ep ->
            { season = ep.season
            , importance =
                List.Extra.find (.name >> (==) (Character.toString character)) ep.characters
                    |> Maybe.map .contrast
                    |> Maybe.withDefault 0
            }
        )
        episodes


config : Bool -> { characters : List Character }
config afterSeason4 =
    let
        characters =
            [ BenjaminSisko, JakeSisko, Dax, KiraNerys, MilesObrien, Bashir, Odo, Quark, Worf, Rom, Nog, Garak, Dukat ]
    in
    { characters =
        if afterSeason4 then
            characters ++ [ KeikoObrien, Winn, Bareil, MichaelEddington, KasidyYates, Leeta, Gowron, Martok, Shakaar, Ziyal, Damar ]

        else
            characters
    }


tags_ : List String
tags_ =
    [ "Federation", "Trill", "Bajor", "Prophet", "Cardassia", "Ferengi", "Klingon", "Maquis", "Mirror Universe" ]


chartSelector : List String -> Html Msg
chartSelector tags =
    ul
        [ css
            [ width (pct 100)
            , padding zero
            , property "display" "grid"
            , property "grid-template-columns" "repeat(auto-fit, minmax(200px, 1fr))"
            , property "gap" "10px"
            ]
        ]
        (List.map
            (\tag ->
                li
                    [ onClick (TableMsg (SortableData.Filter tag tag))
                    , css
                        [ display block
                        , padding (px 10)
                        , borderRadius (px 5)
                        , backgroundColor (hsl 0 0 0.15)
                        , color (hsl 0 0 0.6)
                        , fontSize (px 14)
                        , cursor pointer
                        , transition
                            [ Css.Transitions.backgroundColor 500 ]
                        , hover [ backgroundColor (hsl 0 0 0.2) ]
                        ]
                    ]
                    [ text tag ]
            )
            tags
        )


table : SortableData.Model Episode (Html msg) -> List Episode -> Html msg
table { columns, toId } data =
    Html.Styled.table [ css [ margin2 zero auto, borderCollapse collapse ] ]
        [ Keyed.node "tbody" [] (tableRows toId columns data) ]


tableRows : (Episode -> String) -> List (Column Episode (Html msg)) -> List Episode -> List ( String, Html msg )
tableRows toId columns data =
    let
        indexColumn index =
            td [ css [ textAlign center, fontSize (px 12) ] ] [ text <| String.fromInt (index + 1) ]

        row index d =
            ( toId d
            , lazy2 tr
                [ css
                    [ height (px 31)
                    , fontSize (px 10)
                    , color (hsl 0 0 (stepByImportance d.importance))
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
                indexColumn index
                    :: List.map (\column -> td [] [ column.view d ]) columns
                    ++ [ td []
                            [ button
                                [ type_ "button"
                                , attribute "popovertarget" (toId d)
                                , css
                                    [ cursor pointer
                                    , padding zero
                                    , borderWidth zero
                                    , property "background-color" "unset"
                                    , color inherit
                                    ]
                                ]
                                [ text ">" ]
                            , div
                                [ attribute "popover" ""
                                , id (toId d)
                                , css
                                    [ padding (px 10)
                                    , backgroundColor (hsl 0 0 0.1)
                                    , color (hsl 0 0 0.6)
                                    , borderRadius (px 5)
                                    ]
                                ]
                                [ div [] [ text d.title ]
                                , div [] [ text d.title_ja ]
                                , netflixLink (String.fromInt d.netflix_id)
                                ]
                            ]
                       ]
            )
    in
    List.indexedMap row data


importanceCircle : Episode -> Html msg
importanceCircle { importance } =
    div
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


netflixLink : String -> Html msg
netflixLink netflix_id =
    a
        [ href <| "https://www.netflix.com/watch/" ++ netflix_id
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
