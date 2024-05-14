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
    let
        fromStringWith fromString_ nac =
            fromString_ nac.name
                |> Maybe.map (\name -> { name = name, contrast = nac.contrast })
    in
    Decode.map
        (\d ->
            { season = d.season
            , episode = d.episode
            , title = d.title
            , title_ja = d.title_ja
            , importance = d.importance
            , netflix_id = d.netflix_id
            , characters = List.filterMap (fromStringWith Character.fromString) d.characters
            , organizations = List.filterMap (fromStringWith Organization.fromString) d.organizations
            }
        )
        primitiveDecoder


type alias Episode_Primitive =
    { season : Int
    , episode : Int
    , title : String
    , title_ja : String
    , importance : Int
    , netflix_id : Int
    , characters : List NameAndContrast
    , organizations : List NameAndContrast
    }


type alias NameAndContrast =
    { name : String, contrast : Int }


primitiveDecoder : Decode.Decoder Episode_Primitive
primitiveDecoder =
    Decode.map8 Episode_Primitive
        (field "season" int)
        (field "episode" int)
        (field "title" string)
        (field "title_ja" string)
        (field "importance" int)
        (field "netflix_id" int)
        (field "characters" (Decode.list nameAndContrastDecoder))
        (field "organizations" (Decode.list nameAndContrastDecoder))


nameAndContrastDecoder : Decode.Decoder NameAndContrast
nameAndContrastDecoder =
    Decode.map2 NameAndContrast
        (field "name" string)
        (field "contrast" int)
