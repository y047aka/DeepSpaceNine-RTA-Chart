import fixtures/episodes
import gleam/list
import gleam/string
import gleeunit/should
import types/episode.{type Episode}

// Test fixtures for episode-related functionality

pub fn development_episodes_test() {
  let episodes = episodes.development_episodes()

  // Should have multiple episodes
  list.length(episodes) |> should.equal(173)

  // Should include different seasons
  let season_1_episodes =
    list.filter(episodes, fn(ep: Episode) { ep.season == 1 })
  let season_2_episodes =
    list.filter(episodes, fn(ep: Episode) { ep.season == 2 })
  let season_3_episodes =
    list.filter(episodes, fn(ep: Episode) { ep.season == 3 })

  list.length(season_1_episodes) |> should.equal(19)
  list.length(season_2_episodes) |> should.equal(26)
  list.length(season_3_episodes) |> should.equal(26)
}

pub fn test_episodes_test() {
  let episodes = episode.test_episodes()

  // Should have exactly 2 test episodes
  list.length(episodes) |> should.equal(2)

  // First episode should be season 1, episode 1
  let first_episode = list.first(episodes)
  case first_episode {
    Ok(ep) -> {
      ep.season |> should.equal(1)
      ep.episode |> should.equal(1)
      ep.title |> should.equal("Test Episode One")
    }
    Error(_) -> should.fail()
  }
}

pub fn episode_importance_test() {
  let episodes = episodes.development_episodes()

  // All episodes should have importance between 1 and 5
  list.each(episodes, fn(ep: Episode) {
    should.be_true(ep.importance > 0)
    should.be_true(ep.importance < 6)
  })
}

pub fn episode_characters_test() {
  let episodes = episodes.development_episodes()

  // Most episodes should have characters
  let episodes_with_characters =
    list.filter(episodes, fn(ep: Episode) { list.length(ep.characters) > 0 })

  list.length(episodes_with_characters) |> should.equal(list.length(episodes))
}

pub fn json_export_test() {
  let test_episodes = episode.test_episodes()
  let json_string = episode.episodes_to_json(test_episodes)

  // JSON should contain the episodes
  string.contains(json_string, "\"episodes\"") |> should.be_true
  string.contains(json_string, "Test Episode One") |> should.be_true
  string.contains(json_string, "Test Episode Two") |> should.be_true
}
