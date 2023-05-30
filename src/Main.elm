module Main exposing (main)

import Browser
import Chart
import Css exposing (..)
import Css.Global as Global exposing (children, global)
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
        [ global [ Global.body [ backgroundColor (hex "#000") ] ]
        , Chart.view episodes
        , Html.table [ css [ margin2 zero auto, borderSpacing (px 1) ] ] <|
            List.indexedMap episodeView episodes
        ]


episodeView : Int -> Episode -> Html msg
episodeView index { season, episode, title, title_ja, importance, netflix_id, characters } =
    let
        { benjaminSisko, odo, bashir, dax, jakeSisko, milesObrien, quark, kiraNerys, keikoObrien, garak, dukat, rom, nog, bareil, winn } =
            fromCharacters characters
    in
    tr
        [ css
            [ height (px 31)
            , fontSize (px 10)
            , color (hsl 175 0.6 (stepByImportance importance))
            , children
                [ Global.selector "td:not(:last-child)" [ padding (px 5) ] ]
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
        , td [] [ contrastView benjaminSisko ]
        , td [] [ contrastView odo ]
        , td [] [ contrastView bashir ]
        , td [] [ contrastView dax ]
        , td [] [ contrastView jakeSisko ]
        , td [] [ contrastView milesObrien ]
        , td [] [ contrastView quark ]
        , td [] [ contrastView kiraNerys ]
        , td [] [ contrastView keikoObrien ]
        , td [] [ contrastView garak ]
        , td [] [ contrastView dukat ]
        , td [] [ contrastView rom ]
        , td [] [ contrastView nog ]
        , td [] [ contrastView bareil ]
        , td [] [ contrastView winn ]
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


contrastView : Maybe Int -> Html msg
contrastView contrast =
    let
        c =
            Maybe.withDefault 0 contrast
    in
    div
        [ css
            [ before
                [ property "content" "''"
                , display block
                , margin auto
                , width <| px (toFloat c * 3)
                , height <| px (toFloat c * 3)
                , backgroundColor (hsl 175 0.6 0.3)
                , borderRadius (px 50)
                ]
            ]
        ]
        []


fromCharacters :
    List Character
    ->
        { benjaminSisko : Maybe Int
        , odo : Maybe Int
        , bashir : Maybe Int
        , dax : Maybe Int
        , jakeSisko : Maybe Int
        , milesObrien : Maybe Int
        , quark : Maybe Int
        , kiraNerys : Maybe Int
        , keikoObrien : Maybe Int
        , garak : Maybe Int
        , dukat : Maybe Int
        , rom : Maybe Int
        , nog : Maybe Int
        , bareil : Maybe Int
        , winn : Maybe Int
        }
fromCharacters =
    List.foldl
        (\{ name, contrast } r ->
            case name of
                "Benjamin Sisko" ->
                    { r | benjaminSisko = Just contrast }

                "Odo" ->
                    { r | odo = Just contrast }

                "Bashir" ->
                    { r | bashir = Just contrast }

                "Dax" ->
                    { r | dax = Just contrast }

                "Jake Sisko" ->
                    { r | jakeSisko = Just contrast }

                "Miles O'Brien" ->
                    { r | milesObrien = Just contrast }

                "Quark" ->
                    { r | quark = Just contrast }

                "Kira Nerys" ->
                    { r | kiraNerys = Just contrast }

                "Keiko O'Brien" ->
                    { r | keikoObrien = Just contrast }

                "Garak" ->
                    { r | garak = Just contrast }

                "Dukat" ->
                    { r | dukat = Just contrast }

                "Rom" ->
                    { r | rom = Just contrast }

                "Nog" ->
                    { r | nog = Just contrast }

                "Bareil" ->
                    { r | bareil = Just contrast }

                "Winn" ->
                    { r | winn = Just contrast }

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
        0.5
        -- importance |> toFloat |> (*) 0.15

    else if importance > 2 then
        0.3

    else
        0.15
