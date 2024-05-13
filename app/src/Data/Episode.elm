module Data.Episode exposing (Episode, episodesDecoder)

import Data.Character as Character exposing (Character)
import Data.Organization as Organization exposing (Organization)
import Json.Decode as Decode exposing (field, int, string)


type alias Episode =
    { season : Int
    , episode : Int
    , title : String
    , title_ja : String
    , importance : Int
    , netflix_id : Int
    , characters : List { name : Character, contrast : Int }
    , organizations : List { name : Organization, contrast : Int }
    }


episodesDecoder : Decode.Decoder (List Episode)
episodesDecoder =
    Decode.list episodeDecoder


episodeDecoder : Decode.Decoder Episode
episodeDecoder =
    Decode.map8 Episode
        (field "season" int)
        (field "episode" int)
        (field "title" string)
        (field "title_ja" string)
        (field "importance" int)
        (field "netflix_id" int)
        (field "characters" (Decode.list nameAndContrastDecoder)
            |> Decode.map (List.filterMap (\c -> Character.fromString c.name |> Maybe.map (\c_ -> { name = c_, contrast = c.contrast })))
        )
        (field "organizations" (Decode.list nameAndContrastDecoder)
            |> Decode.map (List.filterMap (\o -> Organization.fromString o.name |> Maybe.map (\o_ -> { name = o_, contrast = o.contrast })))
        )


type alias NameAndContrast =
    { name : String, contrast : Int }


nameAndContrastDecoder : Decode.Decoder NameAndContrast
nameAndContrastDecoder =
    Decode.map2 NameAndContrast
        (field "name" string)
        (field "contrast" int)
