import gleam/int
import gleam/list
import gleam/string
import lustre/attribute
import lustre/element.{type Element}
import lustre/element/html
import types/episode.{type Episode}

// TDD Green Phase: Implement episode table functionality

pub fn view(episodes: List(Episode)) -> Element(msg) {
  html.table([attribute.class("episode-table")], [
    // Table body with episode rows - no header as per Elm implementation
    html.tbody([], episodes |> list.index_map(episode_row)),
  ])
}

pub fn importance_circle(importance: Int) -> Element(msg) {
  html.div(
    [
      attribute.class("importance-circle"),
      attribute.attribute("data-importance", int.to_string(importance)),
    ],
    [],
  )
}

pub fn netflix_link(netflix_id: String) -> Element(msg) {
  html.a(
    [
      attribute.href("https://www.netflix.com/watch/" <> netflix_id),
      attribute.target("_blank"),
      attribute.class("netflix-link"),
    ],
    [html.text("NETFLIX")],
  )
}

pub fn episode_row(episode: Episode, index: Int) -> Element(msg) {
  html.tr(
    [
      attribute.class("episode-row"),
      attribute.style("cursor", "pointer"),
      attribute.attribute("data-importance", int.to_string(episode.importance)),
    ],
    [
      // Index column (episode number starting from 1)
      html.td([attribute.class("episode-index")], [
        html.text(int.to_string(index + 1)),
      ]),
      // Season-Episode column (updated format: "S1 - E1")
      html.td([attribute.class("season-episode")], [
        html.text(
          [
            "S",
            int.to_string(episode.season),
            " - E",
            int.to_string(episode.episode),
          ]
          |> string.concat(),
        ),
      ]),
      // Importance column with circle
      html.td([attribute.class("importance-col")], [
        importance_circle(episode.importance),
      ]),
      // Title column with both English and Japanese titles
      html.td([attribute.class("title-col")], [
        html.div([attribute.class("title-wrapper")], [
          html.div([attribute.class("title-en")], [html.text(episode.title)]),
          html.div([attribute.class("title-ja")], [html.text(episode.title_ja)]),
        ]),
      ]),
      // Action column with ">" button
      html.td([attribute.class("action-col")], [
        html.button(
          [
            attribute.type_("button"),
            attribute.class("action-button"),
            attribute.attribute("popovertarget", episode.title),
          ],
          [html.text(">")],
        ),
        // Popover content (will be styled via CSS)
        html.div(
          [
            attribute.attribute("popover", ""),
            attribute.id(episode.title),
            attribute.class("episode-popover"),
          ],
          [
            html.div([], [html.text(episode.title)]),
            html.div([], [html.text(episode.title_ja)]),
            netflix_link(int.to_string(episode.netflix_id)),
          ],
        ),
      ]),
    ],
  )
}
