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
            [ height (px 31)
            , fontSize (px 10)
            , color (hsl 175 0.6 (stepByImportance importance))
            , children
                [ Global.selector "td:not(:last-child)" [ padding2 (px 5) (px 10) ] ]
            ]
        ]
        [ td [ css [ textAlign center, fontSize (px 12) ] ] [ text <| String.fromInt (index + 1) ]
        , td [ css [ textAlign center ] ]
            [ text <| "S" ++ String.fromInt season ++ " - E" ++ String.fromInt episode ]
        , td
            [ css
                [ before
                    [ property "content" "''"
                    , display block
                    , margin auto
                    , width <| px (toFloat importance * 3)
                    , height <| px (toFloat importance * 3)
                    , backgroundColor currentColor
                    , borderRadius (px 50)
                    ]
                ]
            ]
            []
        , td [ css [ fontSize <| px (toFloat importance + 10) ] ] [ text title ]
        , td [] [ text title_ja ]
        , td []
            [ a
                [ href <| "https://www.netflix.com/watch/" ++ String.fromInt netflix_id
                , Attributes.target "_blank"
                , css
                    [ display tableCell
                    , padding2 (px 0) (px 15)
                    , fontSize (px 12)
                    , textDecoration none
                    , backgroundColor (hsl 350 0.5 0.4)
                    , color (hex "#000")
                    , borderRadius (px 15)
                    , visited [ backgroundColor (hsl 350 0.5 0.15) ]
                    ]
                ]
                [ text "NETFLIX" ]
            ]
        ]


stepByImportance : Int -> Float
stepByImportance importance =
    if importance > 3 then
        0.5
        -- importance |> toFloat |> (*) 0.15

    else if importance > 2 then
        0.3

    else
        0.15
