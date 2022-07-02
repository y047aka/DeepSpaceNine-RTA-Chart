module Episode exposing (Episode, episodesDecoder)

import Json.Decode as Decode exposing (field, int, string)


type alias Episode =
    { season : Int
    , episode : Int
    , title : String
    , title_ja : String
    , importance : Int
    , netflix_id : Int
    , netflix_synopsis : String
    }


episodesDecoder : Decode.Decoder (List Episode)
episodesDecoder =
    Decode.list episodeDecoder


episodeDecoder : Decode.Decoder Episode
episodeDecoder =
    Decode.map7 Episode
        (field "season" int)
        (field "episode" int)
        (field "title" string)
        (field "title_ja" string)
        (field "importance" int)
        (field "netflix_id" int)
        (field "netflix_synopsis" string)
