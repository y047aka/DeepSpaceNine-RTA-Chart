-- init.sql
SET client_encoding = 'UTF8';

CREATE TABLE episodes (
    id SERIAL PRIMARY KEY,
    season INTEGER NOT NULL,
    episode INTEGER NOT NULL,
    title TEXT NOT NULL,
    title_ja TEXT,
    importance INTEGER CHECK (importance BETWEEN 1 AND 5),
    netflix_id BIGINT,
    netflix_synopsis TEXT,
    url_imdb TEXT,
    characters JSONB NOT NULL DEFAULT '[]',
    organizations JSONB NOT NULL DEFAULT '[]',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),

    UNIQUE(season, episode)
);

CREATE INDEX idx_episodes_season_episode ON episodes (season, episode);
CREATE INDEX idx_episodes_importance ON episodes (importance);
CREATE INDEX idx_episodes_characters_gin ON episodes USING GIN (characters);
