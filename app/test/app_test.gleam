import app
import gleeunit
import gleeunit/should

pub fn main() {
  gleeunit.main()
}

pub fn model_test() {
  let model = app.Model(episodes: [])
  model.episodes |> should.equal([])
}

pub fn init_test() {
  let #(model, _) = app.init(Nil)
  // Initially episodes should be empty, loaded via HTTP effect
  model.episodes |> should.equal([])
}
