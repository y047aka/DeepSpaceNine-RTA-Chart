import gleeunit
import gleeunit/should
import gleam/list
import app
import utils/json_decoder
import types/episode

pub fn main() {
  gleeunit.main()
}

// TDD Red Phase: Test app initialization with real episode data
pub fn app_init_with_episodes_test() {
  let model = app.init(Nil)
  
  // Model should have episodes loaded
  model.episodes |> list.length() |> should.not_equal(0)
  
  // First episode should be "Emissary"
  case model.episodes {
    [first, ..] -> {
      first.season |> should.equal(1)
      first.episode |> should.equal(1) 
      first.title |> should.equal("Emissary")
    }
    [] -> should.fail()
  }
  
  // Initial state should have after_season_4 as False
  model.after_season_4 |> should.equal(False)
}

// TDD Red Phase: Test toggle functionality
pub fn app_toggle_test() {
  let initial_model = app.init(Nil)
  let updated_model = app.update(initial_model, app.Toggle)
  
  // after_season_4 should be toggled
  updated_model.after_season_4 |> should.equal(!initial_model.after_season_4)
  
  // Episodes should remain the same
  updated_model.episodes |> should.equal(initial_model.episodes)
}

// TDD Red Phase: Test JSON decoder integration
pub fn json_decoder_integration_test() {
  let result = json_decoder.decode_episodes_from_js()
  
  case result {
    Ok(episodes) -> {
      episodes |> list.length() |> should.not_equal(0)
      // Should have at least the basic episode data
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