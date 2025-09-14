import components/histogram
import gleeunit
import gleeunit/should

pub fn main() {
  gleeunit.main()
}

pub fn hsl_color_test() {
  let color = histogram.hsl_color("var(--hue-cardassian)", 3)
  color.variable |> should.equal("var(--cardassian-3)")
}
