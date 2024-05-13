module Data.Episode exposing (Episode, episodesDecoder)

import Data.Organization as Organization exposing (Organization)
import Json.Decode as Decode exposing (field, int, string)


type alias Episode =
    { season : Int
    , episode : Int
    , title : String
    , title_ja : String
    , importance : Int
    , netflix_id : Int
    , characters : List NameAndContrast
    , organizations : List { name : Organization, contrast : Int }
    }


type alias NameAndContrast =
    { name : String, contrast : Int }


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
        (field "characters" (Decode.list characterDecoder))
        (field "organizations" (Decode.list organizationDecoder)
            |> Decode.map (List.filterMap (\{ name, contrast } -> Organization.fromString name |> Maybe.map (\o -> { name = o, contrast = contrast })))
        )


characterDecoder : Decode.Decoder NameAndContrast
characterDecoder =
    Decode.map2 NameAndContrast
        (field "name" string)
        (field "contrast" int)


organizationDecoder : Decode.Decoder NameAndContrast
organizationDecoder =
    Decode.map2 NameAndContrast
        (field "name" string)
        (field "contrast" int)
