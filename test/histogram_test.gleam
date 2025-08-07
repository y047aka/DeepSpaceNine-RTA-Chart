import components/histogram
import gleeunit
import gleeunit/should

pub fn main() {
  gleeunit.main()
}

pub fn step_by_importance_test() {
  histogram.step_by_importance(5) |> should.equal(0.8)
  histogram.step_by_importance(4) |> should.equal(0.6)
  histogram.step_by_importance(3) |> should.equal(0.3)
  histogram.step_by_importance(2) |> should.equal(0.17)
  histogram.step_by_importance(1) |> should.equal(0.1)
  histogram.step_by_importance(0) |> should.equal(0.0)
}

pub fn hsl_color_test() {
  let color = histogram.hsl_color(175, 0.8, 0.5)
  color.hue |> should.equal(175)
  color.saturation |> should.equal(0.8)
  color.lightness |> should.equal(0.5)
  color.alpha |> should.equal(1.0)
}
