import lustre/element.{type Element}
import lustre/element/html
import lustre/attribute
import gleam/float
import gleam/int
import gleam/list

pub type Color {
  Color(hue: Int, saturation: Float, lightness: Float, alpha: Float)
}

pub type SeasonImportance {
  SeasonImportance(season: Int, importance: Int)
}

pub fn step_by_importance(importance: Int) -> Float {
  case importance {
    5 -> 0.8
    4 -> 0.6
    3 -> 0.3
    2 -> 0.17
    1 -> 0.1
    _ -> 0.0
  }
}

pub fn hsl_color(hue: Int, saturation: Float, lightness: Float) -> Color {
  Color(hue: hue, saturation: saturation, lightness: lightness, alpha: 1.0)
}

pub fn color_to_css_string(color: Color) -> String {
  "hsla("
  <> int.to_string(color.hue)
  <> ", "
  <> float.to_string(color.saturation *. 100.0)
  <> "%, "
  <> float.to_string(color.lightness *. 100.0)
  <> "%, "
  <> float.to_string(color.alpha)
  <> ")"
}

pub fn colored_cell(background_color: Color) -> Element(msg) {
  html.div([
    attribute.style("width", "100%"),
    attribute.style("height", "100%"),
    attribute.style("border-radius", "10%"),
    attribute.style("background-color", color_to_css_string(background_color))
  ], [])
}

pub fn view(hue: Int, episodes: List(SeasonImportance)) -> Element(msg) {
  // For now, create a simple view without complex grouping
  let to_color = fn(ep: SeasonImportance) {
    hsl_color(hue, 0.8, step_by_importance(ep.importance))
  }
  
  html.div([
    attribute.style("display", "grid"),
    attribute.style("grid-template-columns", "repeat(7, auto)"),
    attribute.style("gap", "0.3vw")
  ], list.map(episodes, fn(ep) { colored_cell(to_color(ep)) }))
}

pub fn large_view(hue: Int, episodes: List(SeasonImportance)) -> Element(msg) {
  let to_color = fn(ep: SeasonImportance) {
    hsl_color(hue, 0.8, step_by_importance(ep.importance))
  }
  
  html.div([
    attribute.style("display", "grid"),
    attribute.style("grid-template-columns", "repeat(7, auto)"),
    attribute.style("gap", "3px")
  ], list.map(episodes, fn(ep) { colored_cell(to_color(ep)) }))
}