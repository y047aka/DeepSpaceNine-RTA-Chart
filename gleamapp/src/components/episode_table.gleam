import lustre/element.{type Element}
import lustre/element/html
import lustre/attribute
import gleam/list
import gleam/int
import gleam/string
import types/episode.{type Episode}

// TDD Green Phase: Implement episode table functionality

pub fn view(episodes: List(Episode)) -> Element(msg) {
  html.table([attribute.class("episode-table")], [
    // Table header
    html.thead([], [
      html.tr([], [
        html.th([], [html.text("Season-Episode")]),
        html.th([], [html.text("Importance")]),
        html.th([], [html.text("Title")])
      ])
    ]),
    // Table body with episode rows
    html.tbody([], 
      episodes |> list.map(episode_row)
    )
  ])
}

pub fn importance_circle(importance: Int) -> Element(msg) {
  let circle_size = case importance {
    5 -> "20px"
    4 -> "16px" 
    3 -> "12px"
    2 -> "8px"
    1 -> "6px"
    _ -> "4px"
  }
  
  html.div([
    attribute.class("importance-circle"),
    attribute.style("width", circle_size),
    attribute.style("height", circle_size),
    attribute.style("background-color", "#ffffff"),
    attribute.style("border-radius", "50%"),
    attribute.style("display", "inline-block")
  ], [])
}

pub fn episode_row(episode: Episode) -> Element(msg) {
  html.tr([
    attribute.class("episode-row"),
    attribute.style("cursor", "pointer")
  ], [
    // Season-Episode column
    html.td([], [
      html.text("S" <> int.to_string(episode.season) <> "E" <> int.to_string(episode.episode))
    ]),
    // Importance column with circle
    html.td([attribute.style("text-align", "center")], [
      importance_circle(episode.importance)
    ]),
    // Title column
    html.td([], [
      html.text(episode.title)
    ])
  ])
}