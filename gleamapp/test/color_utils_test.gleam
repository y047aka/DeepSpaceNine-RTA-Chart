import gleeunit
import gleeunit/should
import components/histogram
import utils/color_utils

pub fn main() {
  gleeunit.main()
}

// TDD Red Phase: Test color utilities
pub fn step_by_importance_test() {
  // Test importance to lightness mapping
  histogram.step_by_importance(5) |> should.equal(0.8)
  histogram.step_by_importance(4) |> should.equal(0.6)
  histogram.step_by_importance(3) |> should.equal(0.3)
  histogram.step_by_importance(2) |> should.equal(0.17)
  histogram.step_by_importance(1) |> should.equal(0.1)
  histogram.step_by_importance(0) |> should.equal(0.0)
}

// TDD Red Phase: Test HSL color creation
pub fn hsl_color_test() {
  let color = histogram.hsl_color(175, 0.8, 0.5)
  color.hue |> should.equal(175)
  color.saturation |> should.equal(0.8)
  color.lightness |> should.equal(0.5)
  color.alpha |> should.equal(1.0)
}

// TDD Red Phase: Test color to CSS string conversion
pub fn color_to_css_string_test() {
  let color = histogram.hsl_color(120, 0.8, 0.6)
  let css_string = histogram.color_to_css_string(color)
  
  css_string |> should.equal("hsla(120, 80.0%, 60.0%, 1.0)")
}

// TDD Red Phase: Test character hue calculation
pub fn character_hue_calculation_test() {
  // This will test using the hue values from character types
  let sisko_hue = color_utils.get_character_hue("Benjamin Sisko")
  let dax_hue = color_utils.get_character_hue("Dax")
  
  sisko_hue |> should.equal(350) // Command color
  dax_hue |> should.equal(190)   // Science/Medical color
}

// TDD Red Phase: Test organization hue calculation  
pub fn organization_hue_calculation_test() {
  let federation_hue = color_utils.get_organization_hue("Federation")
  let bajor_hue = color_utils.get_organization_hue("Bajor")
  
  federation_hue |> should.equal(220)
  bajor_hue |> should.equal(10)
}