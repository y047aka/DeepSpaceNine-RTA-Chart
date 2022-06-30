module Main exposing (main)

import Browser
import Css exposing (..)
import Episode exposing (Episode, episodesDecoder)
import Html.Styled as Html exposing (Html, a, span, td, text, toUnstyled, tr)
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
    Html.table [] <|
        List.indexedMap
            (\index { season, episode, title, title_ja, netflix_id } ->
                tr []
                    [ td [] [ text <| String.fromInt (index + 1) ]
                    , td [] [ text <| "S" ++ String.fromInt season ++ "-E" ++ String.fromInt episode ]
                    , td []
                        [ text title
                        , span [ css [ display block, fontSize (em 0.6), color (hex "#666") ] ] [ text title_ja ]
                        ]
                    , td [] [ a [ href <| "https://www.netflix.com/watch/" ++ String.fromInt netflix_id, Attributes.target "_blank" ] [ text "Netflix" ] ]
                    ]
            )
            episodes
