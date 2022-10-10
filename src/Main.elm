module Main exposing (main)

import Browser
import Css exposing (..)
import Css.Global as Global exposing (children, global)
import Episode exposing (Episode, episodesDecoder)
import Html.Styled as Html exposing (Html, a, div, td, text, toUnstyled, tr)
import Html.Styled.Attributes as Attributes exposing (css, href)
import Http


main : Program () Model Msg
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


init : () -> ( Model, Cmd Msg )
init _ =
    ( { episodes = [] }, fetchJson )


fetchJson : Cmd Msg
fetchJson =
    Http.get
        { url = "/static/episodes.json"
        , expect = Http.expectJson Loaded episodesDecoder
        }



-- UPDATE


type Msg
    = Loaded (Result Http.Error (List Episode))


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Loaded (Ok decoded) ->
            ( { model | episodes = decoded }, Cmd.none )

        Loaded (Err _) ->
            ( model, Cmd.none )



-- VIEW


view : Model -> Html Msg
view { episodes } =
    div []
        [ global [ Global.body [ backgroundColor (hex "#000") ] ]
        , Html.table [ css [ margin2 zero auto, borderSpacing (px 1) ] ] <|
            List.indexedMap episodeView episodes
        ]


episodeView : Int -> Episode -> Html msg
episodeView index { season, episode, title, title_ja, importance, netflix_id } =
    tr
        [ css
            [ backgroundColor (hsl 175 0.6 (backgroundByImportance importance))
            , children
                [ Global.selector "td:not(:last-child)" [ padding2 (px 5) (px 10) ] ]
            ]
        ]
        [ td [ css [ textAlign center, fontSize (px 14) ] ] [ text <| String.fromInt (index + 1) ]
        , td [ css [ textAlign center ] ]
            [ div [ css [ fontSize (px 10) ] ] [ text <| "Season " ++ String.fromInt season ]
            , div [ css [ fontSize (px 12) ] ] [ text <| "" ++ String.fromInt episode ]
            ]
        , td []
            [ text title
            , div [ css [ fontSize (px 10) ] ] [ text title_ja ]
            ]
        , td [ css [ property "display" "contents" ] ]
            [ a
                [ href <| "https://www.netflix.com/watch/" ++ String.fromInt netflix_id
                , Attributes.target "_blank"
                , css
                    [ display tableCell
                    , padding2 zero (px 10)
                    , verticalAlign middle
                    , textDecoration none
                    , backgroundColor (hsl 350 0.5 0.5)
                    , color inherit
                    , visited [ backgroundColor (hsl 350 0.5 0.2) ]
                    ]
                ]
                [ text "NETFLIX" ]
            ]
        ]


backgroundByImportance : Int -> Float
backgroundByImportance importance =
    importance |> toFloat |> (*) 0.1 |> (+) 0.2
