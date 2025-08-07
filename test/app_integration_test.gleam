import app
import gleam/json
import gleam/list
import gleeunit
import gleeunit/should
import types/episode

pub fn main() {
  gleeunit.main()
}

// TDD Red Phase: Test app initialization - now uses HTTP effects
pub fn app_init_with_episodes_test() {
  let #(model, _) = app.init(Nil)

  // Model should initially be empty (episodes loaded via HTTP effect)
  model.episodes |> list.length() |> should.equal(0)

  // Initial state should have after_season_4 as False
  model.after_season_4 |> should.equal(False)
}

// TDD Red Phase: Test toggle functionality
pub fn app_toggle_test() {
  let #(initial_model, _) = app.init(Nil)
  let #(updated_model, _) = app.update(initial_model, app.Toggle)

  // after_season_4 should be toggled
  updated_model.after_season_4 |> should.equal(!initial_model.after_season_4)

  // Episodes should remain the same
  updated_model.episodes |> should.equal(initial_model.episodes)
}

// TDD Red Phase: Test JSON decoder integration with sample data
pub fn json_decoder_integration_test() {
  let sample_json =
    "[{\"season\":1,\"episode\":1,\"title\":\"Emissary\",\"title_ja\":\"聖なる神殿の謎\",\"importance\":4,\"netflix_id\":70205806,\"characters\":[{\"name\":\"Benjamin Sisko\",\"contrast\":4},{\"name\":\"Dax\",\"contrast\":4}],\"organizations\":[{\"name\":\"Federation\",\"contrast\":5},{\"name\":\"Bajor\",\"contrast\":5}]}]"

  let result = json.parse(sample_json, episode.episodes_decoder())

  case result {
    Ok(episodes) -> {
      episodes |> list.length() |> should.not_equal(0)
      case episodes {
        [first, ..] -> {
          first.title |> should.equal("Emissary")
          first.characters |> list.length() |> should.not_equal(0)
          first.organizations |> list.length() |> should.not_equal(0)
        }
        [] -> should.fail()
      }
    }
    Error(_) -> should.fail()
  }
}
