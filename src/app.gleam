// IMPORTS ---------------------------------------------------------------------

import components/episode_table
import components/histogram
import gleam/list
import gleam/result
import lustre
import lustre/attribute
import lustre/effect.{type Effect}
import lustre/element.{type Element}
import lustre/element/html
import lustre/event
import rsvp
import types/character.{type Character}
import types/episode.{type Episode}
import types/error
import types/organization.{type Organization}

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
  on_response handle_response: fn(Result(List(Episode), error.AppError)) -> msg,
) -> Effect(msg) {
  let url = "./priv/static/episodes.json"
  let handler =
    rsvp.expect_json(episode.episodes_decoder(), fn(result) {
      result
      |> result.map_error(error.HttpRequestError)
      |> handle_response
    })

  rsvp.get(url, handler)
}

// UPDATE ----------------------------------------------------------------------

pub type Msg {
  Toggle
  LoadedEpisodes(Result(List(Episode), error.AppError))
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
    LoadedEpisodes(Error(app_error)) -> {
      error.log_error(app_error)
      #(model, effect.none())
    }
  }
}

// HELPERS ---------------------------------------------------------------------

fn get_characters(after_season_4: Bool) -> List(Character) {
  let base_characters = [
    character.BenjaminSisko,
    character.JakeSisko,
    character.Dax,
    character.KiraNerys,
    character.MilesObrien,
    character.Bashir,
    character.Odo,
    character.Quark,
    character.Worf,
    character.Rom,
    character.Nog,
    character.Garak,
    character.Dukat,
  ]

  let extended_characters = [
    character.KeikoObrien,
    character.Winn,
    character.Bareil,
    character.MichaelEddington,
    character.KasidyYates,
    character.Leeta,
    character.Gowron,
    character.Martok,
    character.Shakaar,
    character.Ziyal,
    character.Damar,
  ]

  case after_season_4 {
    True -> list.append(base_characters, extended_characters)
    False -> base_characters
  }
}

fn get_organizations() -> List(Organization(String)) {
  [
    organization.Federation(""),
    organization.TrillSymbiosisCommission,
    organization.BajoranProvisionalGov(""),
    organization.ProphetsTemple,
    organization.CardassianUnion,
    organization.FerengiAlliance,
    organization.KlingonEmpire,
    organization.Maquis,
    organization.DominionForces(""),
    organization.MirrorUniverse,
  ]
}

// VIEW ------------------------------------------------------------------------

pub fn view(model: Model) -> Element(Msg) {
  html.div([attribute.class("container")], [
    view_main_histogram(model.episodes),
    view_character_section(model.after_season_4, model.episodes),
    view_organization_section(model.episodes),
    view_episode_table_section(model.episodes),
  ])
}

fn view_main_histogram(episodes: List(Episode)) -> Element(Msg) {
  let episodes_data =
    episodes
    |> list.map(fn(ep) {
      histogram.SeasonImportance(
        season: ep.season,
        episode: ep.episode,
        importance: ep.importance,
      )
    })

  html.div([attribute.class("section")], [
    html.div([attribute.class("section-title")], [
      html.text("Deep Space Nine"),
    ]),
    histogram.large_view(175, episodes_data),
  ])
}

fn view_character_section(
  after_season_4: Bool,
  episodes: List(Episode),
) -> Element(Msg) {
  html.div([], [
    html.label([attribute.class("checkbox-label")], [
      html.input([
        attribute.type_("checkbox"),
        attribute.checked(after_season_4),
        event.on_click(Toggle),
      ]),
      html.text("Show more characters"),
    ]),
    html.div(
      [attribute.class("histograms-grid")],
      get_characters(after_season_4)
        |> list.map(fn(char) {
          let char_episodes = episode.get_character_episodes(char, episodes)
          html.div([attribute.class("section")], [
            html.div([attribute.class("section-title")], [
              html.text(character.to_string(char)),
            ]),
            histogram.view(character.image_hue(char), char_episodes),
          ])
        }),
    ),
  ])
}

fn view_organization_section(episodes: List(Episode)) -> Element(Msg) {
  html.div(
    [attribute.class("histograms-grid")],
    get_organizations()
      |> list.map(fn(org) {
        let org_episodes = episode.get_organization_episodes(org, episodes)
        html.div([attribute.class("section")], [
          html.div([attribute.class("section-title")], [
            html.text(organization.to_string(org)),
          ]),
          histogram.view(organization.to_hue(org), org_episodes),
        ])
      }),
  )
}

fn view_episode_table_section(episodes: List(Episode)) -> Element(Msg) {
  html.div([attribute.class("section")], [
    html.div([attribute.class("section-title")], [html.text("Episode List")]),
    episode_table.view(episodes),
  ])
}
