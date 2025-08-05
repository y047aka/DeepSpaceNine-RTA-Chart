import gleeunit
import gleeunit/should
import app

pub fn main() {
  gleeunit.main()
}

pub fn model_test() {
  let model = app.Model(episodes: [], after_season_4: False)
  model.episodes |> should.equal([])
  model.after_season_4 |> should.equal(False)
}

pub fn init_test() {
  let model = app.init(Nil)
  model.episodes |> should.equal([])
  model.after_season_4 |> should.equal(False)
}

pub fn toggle_test() {
  let model = app.Model(episodes: [], after_season_4: False)
  let updated_model = app.update(model, app.Toggle)
  updated_model.after_season_4 |> should.equal(True)
  
  let toggled_back = app.update(updated_model, app.Toggle)
  toggled_back.after_season_4 |> should.equal(False)
}