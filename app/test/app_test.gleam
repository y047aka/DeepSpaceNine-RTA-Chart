import app
import gleeunit
import gleeunit/should

pub fn main() {
  gleeunit.main()
}

pub fn model_test() {
  let model = app.Model(episodes: [], current_view: app.HomeView)
  model.episodes |> should.equal([])
}

pub fn init_test() {
  let #(model, _) = app.init(Nil)
  // Initially episodes should be empty, loaded via HTTP effect
  model.episodes |> should.equal([])
  model.current_view |> should.equal(app.HomeView)
}
