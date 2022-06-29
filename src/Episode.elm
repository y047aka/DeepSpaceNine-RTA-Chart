module Episode exposing (Episode, episodesDecoder)

import Json.Decode as Decode exposing (field, int, string)


type alias Episode =
    { season : Int
    , title_ja : String
    , netflix_id : Int
    , netflix_synopsis : String
    }


episodesDecoder : Decode.Decoder (List Episode)
episodesDecoder =
    Decode.list episodeDecoder


episodeDecoder : Decode.Decoder Episode
episodeDecoder =
    Decode.map4 Episode
        (field "season" int)
        (field "title_ja" string)
        (field "netflix_id" int)
        (field "netflix_synopsis" string)
