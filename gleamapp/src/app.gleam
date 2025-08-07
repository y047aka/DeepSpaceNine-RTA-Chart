// IMPORTS ---------------------------------------------------------------------

import components/episode_table
import components/histogram
import lustre
import lustre/attribute
import lustre/effect.{type Effect}
import lustre/element.{type Element}
import lustre/element/html
import lustre/event
import rsvp
import types/episode.{type Episode}

// MAIN ------------------------------------------------------------------------

pub fn main() {
  let app = lustre.application(init, update, view)
  let assert Ok(_) = lustre.start(app, "#app", Nil)
  Nil
}

// MODEL -----------------------------------------------------------------------

pub type Model {
  Model(episodes: List(Episode), after_season_4: Bool)
}

pub fn init(_) -> #(Model, Effect(Msg)) {
  let model = Model(episodes: [], after_season_4: False)
  let effect = fetch_episodes(on_response: LoadedEpisodes)

  #(model, effect)
}

fn fetch_episodes(
  on_response handle_response: fn(Result(List(Episode), rsvp.Error)) -> msg,
) -> Effect(msg) {
  let url = "/priv/static/episodes.json"
  let handler = rsvp.expect_json(episode.episodes_decoder(), handle_response)

  rsvp.get(url, handler)
}

// UPDATE ----------------------------------------------------------------------

pub type Msg {
  Toggle
  LoadedEpisodes(Result(List(Episode), rsvp.Error))
}

pub fn update(model: Model, msg: Msg) -> #(Model, Effect(Msg)) {
  case msg {
    Toggle -> #(
      Model(..model, after_season_4: !model.after_season_4),
      effect.none(),
    )
    LoadedEpisodes(Ok(episodes)) -> #(
      Model(..model, episodes: episodes),
      effect.none(),
    )
    LoadedEpisodes(Error(_)) -> #(model, effect.none())
  }
}

// VIEW ------------------------------------------------------------------------

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
