// IMPORTS ---------------------------------------------------------------------

import components/episode_table
import components/histogram
import gleam/list
import lustre
import lustre/attribute
import lustre/effect.{type Effect}
import lustre/element.{type Element}
import lustre/element/html
import lustre/event
import rsvp
import types/character.{type Character}
import types/episode.{type Episode}
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
  on_response handle_response: fn(Result(List(Episode), rsvp.Error)) -> msg,
) -> Effect(msg) {
  let url = "./priv/static/episodes.json"
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

fn get_organizations() -> List(Organization) {
  [
    organization.Federation,
    organization.Trill,
    organization.Bajor,
    organization.Prophet,
    organization.Cardassia,
    organization.Ferengi,
    organization.Klingon,
    organization.Maquis,
    organization.Dominion,
    organization.MirrorUniverse,
  ]
}

// VIEW ------------------------------------------------------------------------

pub fn view(model: Model) -> Element(Msg) {
  // Convert episodes to SeasonImportance format for main histogram
  let episodes_data =
    list.map(model.episodes, fn(ep) {
      histogram.SeasonImportance(
        season: ep.season,
        episode: ep.episode,
        importance: ep.importance,
      )
    })

  html.div([attribute.class("container")], [
    // Large histogram section
    html.div([attribute.class("section")], [
      html.div([attribute.class("section-title")], [
        html.text("Deep Space Nine"),
      ]),
      histogram.large_view(175, episodes_data),
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
      html.div(
        [attribute.class("histograms-grid")],
        list.map(get_characters(model.after_season_4), fn(char) {
          let char_episodes =
            episode.get_character_episodes(char, model.episodes)
          html.div([attribute.class("section")], [
            html.div([attribute.class("section-title")], [
              html.text(character.to_string(char)),
            ]),
            histogram.view(character.image_hue(char), char_episodes),
          ])
        }),
      ),
    ]),
    // Organizations section
    html.div(
      [attribute.class("histograms-grid")],
      list.map(get_organizations(), fn(org) {
        let org_episodes =
          episode.get_organization_episodes(org, model.episodes)
        html.div([attribute.class("section")], [
          html.div([attribute.class("section-title")], [
            html.text(organization.to_string(org)),
          ]),
          histogram.view(organization.image_hue(org), org_episodes),
        ])
      }),
    ),
    // Episode table section
    html.div([attribute.class("section")], [
      html.div([attribute.class("section-title")], [html.text("Episode List")]),
      episode_table.view(model.episodes),
    ]),
  ])
}
