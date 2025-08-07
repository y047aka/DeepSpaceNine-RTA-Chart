import gleam/dict
import gleam/float
import gleam/int
import gleam/list
import lustre/attribute
import lustre/element.{type Element}
import lustre/element/html

pub type Color {
  Color(hue: Int, saturation: Float, lightness: Float, alpha: Float)
}

pub type SeasonImportance {
  SeasonImportance(season: Int, episode: Int, importance: Int)
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
  html.div(
    [
      attribute.class("histogram-cell"),
      attribute.style("background-color", color_to_css_string(background_color)),
    ],
    [],
  )
}

pub fn view(hue: Int, episodes: List(SeasonImportance)) -> Element(msg) {
  let to_color = fn(ep: SeasonImportance) {
    hsl_color(hue, 0.8, step_by_importance(ep.importance))
  }

  let grouped_episodes = list.group(episodes, fn(ep) { ep.season })

  html.div(
    [attribute.class("small-histogram")],
    dict.to_list(grouped_episodes)
      |> list.sort(fn(a, b) { int.compare(a.0, b.0) })
      |> list.map(fn(season_group) {
        let #(_season, season_episodes) = season_group
        let sorted_episodes = list.sort(season_episodes, fn(a, b) { int.compare(a.episode, b.episode) })
        html.div(
          [attribute.class("season")],
          list.map(sorted_episodes, fn(ep) { colored_cell(to_color(ep)) }),
        )
      }),
  )
}

pub fn large_view(hue: Int, episodes: List(SeasonImportance)) -> Element(msg) {
  let to_color = fn(ep: SeasonImportance) {
    hsl_color(hue, 0.8, step_by_importance(ep.importance))
  }

  let grouped_episodes = list.group(episodes, fn(ep) { ep.season })

  html.div(
    [attribute.class("large-histogram")],
    dict.to_list(grouped_episodes)
      |> list.sort(fn(a, b) { int.compare(a.0, b.0) })
      |> list.map(fn(season_group) {
        let #(_season, season_episodes) = season_group
        let sorted_episodes = list.sort(season_episodes, fn(a, b) { int.compare(a.episode, b.episode) })
        html.div(
          [attribute.class("season")],
          list.map(sorted_episodes, fn(ep) { colored_cell(to_color(ep)) }),
        )
      }),
  )
}
