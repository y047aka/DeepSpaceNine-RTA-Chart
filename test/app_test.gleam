import app
import gleeunit
import gleeunit/should

pub fn main() {
  gleeunit.main()
}

pub fn model_test() {
  let model = app.Model(episodes: [], after_season_4: False)
  model.episodes |> should.equal([])
  model.after_season_4 |> should.equal(False)
}

pub fn init_test() {
  let #(model, _) = app.init(Nil)
  // Initially episodes should be empty, loaded via HTTP effect
  model.episodes |> should.equal([])
  model.after_season_4 |> should.equal(False)
}

pub fn toggle_test() {
  let model = app.Model(episodes: [], after_season_4: False)
  let #(updated_model, _) = app.update(model, app.Toggle)
  updated_model.after_season_4 |> should.equal(True)

  let #(toggled_back, _) = app.update(updated_model, app.Toggle)
  toggled_back.after_season_4 |> should.equal(False)
}
