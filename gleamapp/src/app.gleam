import components/episode_table
import components/histogram
import lustre
import lustre/attribute
import lustre/element.{type Element}
import lustre/element/html
import lustre/event
import types/episode.{type Episode}
import utils/json_decoder

pub type Model {
  Model(episodes: List(Episode), after_season_4: Bool)
}

pub type Msg {
  Toggle
}

pub fn init(_flags) -> Model {
  let episodes = case json_decoder.decode_episodes_from_js() {
    Ok(eps) -> eps
    Error(_) -> []
  }
  Model(episodes: episodes, after_season_4: False)
}

pub fn update(model: Model, msg: Msg) -> Model {
  case msg {
    Toggle -> Model(..model, after_season_4: !model.after_season_4)
  }
}

pub fn view(model: Model) -> Element(Msg) {
  let sample_episodes = [
    histogram.SeasonImportance(season: 1, importance: 5),
    histogram.SeasonImportance(season: 1, importance: 4),
    histogram.SeasonImportance(season: 1, importance: 3),
    histogram.SeasonImportance(season: 2, importance: 5),
    histogram.SeasonImportance(season: 2, importance: 4),
    histogram.SeasonImportance(season: 3, importance: 5),
  ]

  html.div([attribute.class("container")], [
    // Large histogram section
    html.div([attribute.class("section")], [
      html.div([attribute.class("section-title")], [
        html.text("Deep Space Nine"),
      ]),
      histogram.large_view(175, sample_episodes),
    ]),
    // Characters section
    html.div([], [
      html.label([attribute.class("checkbox-label")], [
        html.input([
          attribute.type_("checkbox"),
          attribute.checked(model.after_season_4),
          event.on_click(Toggle),
        ]),
        html.text("Show more characters"),
      ]),
      html.div([attribute.class("histograms-grid")], [
        html.div([attribute.class("section")], [
          html.div([attribute.class("section-title")], [
            html.text("Benjamin Sisko"),
          ]),
          histogram.view(350, sample_episodes),
        ]),
        html.div([attribute.class("section")], [
          html.div([attribute.class("section-title")], [html.text("Dax")]),
          histogram.view(190, sample_episodes),
        ]),
        html.div([attribute.class("section")], [
          html.div([attribute.class("section-title")], [html.text("Kira Nerys")]),
          histogram.view(10, sample_episodes),
        ]),
      ]),
    ]),
    // Organizations section
    html.div([attribute.class("histograms-grid")], [
      html.div([attribute.class("section")], [
        html.div([attribute.class("section-title")], [html.text("Federation")]),
        histogram.view(220, sample_episodes),
      ]),
      html.div([attribute.class("section")], [
        html.div([attribute.class("section-title")], [html.text("Bajor")]),
        histogram.view(10, sample_episodes),
      ]),
      html.div([attribute.class("section")], [
        html.div([attribute.class("section-title")], [html.text("Cardassia")]),
        histogram.view(175, sample_episodes),
      ]),
    ]),
    // Episode table section
    html.div([attribute.class("section")], [
      html.div([attribute.class("section-title")], [html.text("Episode List")]),
      episode_table.view(model.episodes),
    ]),
  ])
}

pub fn main() {
  let app = lustre.simple(init, update, view)
  let assert Ok(_) = lustre.start(app, "#app", Nil)
  Nil
}
