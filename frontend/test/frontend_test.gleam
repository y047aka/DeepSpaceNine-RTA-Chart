import frontend
import gleeunit
import gleeunit/should
import types/route

pub fn main() {
  gleeunit.main()
}

pub fn model_test() {
  let model = frontend.Model(episodes: [], route: route.Home)
  model.episodes |> should.equal([])
}

pub fn init_test() {
  let #(model, _) = frontend.init(Nil)
  // Initially episodes should be empty, loaded via HTTP effect
  model.episodes |> should.equal([])
  model.route |> should.equal(route.Home)
}
