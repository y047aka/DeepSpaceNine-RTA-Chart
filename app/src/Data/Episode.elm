module Data.Episode exposing (Character, Episode, episodesDecoder)

import Json.Decode as Decode exposing (field, int, string)


type alias Episode =
    { season : Int
    , episode : Int
    , title : String
    , title_ja : String
    , importance : Int
    , netflix_id : Int
    , tags : List String
    , characters : List Character
    }


type alias Character =
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
        (field "tags" (Decode.list string))
        (field "characters" (Decode.list characterDecoder))


characterDecoder : Decode.Decoder Character
characterDecoder =
    Decode.map2 Character
        (field "name" string)
        (field "contrast" int)
