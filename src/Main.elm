module Main exposing (main)

import Browser
import Episode exposing (Episode, episodesDecoder)
import Html
import Html.Styled exposing (Html, a, table, td, text, toUnstyled, tr)
import Html.Styled.Attributes exposing (href, target)
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
    table [] <|
        List.indexedMap
            (\index { season, episode, title, title_ja, netflix_id } ->
                tr []
                    [ td [] [ text <| String.fromInt (index + 1) ]
                    , td [] [ text <| "S" ++ String.fromInt season ++ "-E" ++ String.fromInt episode ]
                    , td [] [ text title ]
                    , td [] [ text title_ja ]
                    , td [] [ a [ href <| "https://www.netflix.com/watch/" ++ String.fromInt netflix_id, target "_blank" ] [ text "Netflix" ] ]
                    ]
            )
            episodes
