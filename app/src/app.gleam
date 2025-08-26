// IMPORTS ---------------------------------------------------------------------

import components/episode_table
import components/histogram
import gleam/list
import gleam/result
import lustre
import lustre/attribute
import lustre/effect.{type Effect}
import lustre/element.{type Element}
import lustre/element/html.{text}
import rsvp
import types/character.{type Character}
import types/episode.{type Episode}
import types/error
import types/organization.{type Organization}
import types/role

// MAIN ------------------------------------------------------------------------

pub fn main() {
  let app = lustre.application(init, update, view)
  let assert Ok(_) = lustre.start(app, "#app", Nil)
  Nil
}

// MODEL -----------------------------------------------------------------------

pub type Model {
  Model(episodes: List(Episode))
}

pub fn init(_) -> #(Model, Effect(Msg)) {
  let model = Model(episodes: [])
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
  LoadedEpisodes(Result(List(Episode), error.AppError))
}

pub fn update(model: Model, msg: Msg) -> #(Model, Effect(Msg)) {
  case msg {
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

fn get_characters() -> List(Character) {
  [
    character.benjamin_sisko,
    character.jake_sisko,
    character.dax,
    character.kira_nerys,
    character.miles_obrien,
    character.bashir,
    character.odo,
    character.quark,
    character.worf,
    character.rom,
    character.nog,
    character.garak,
    character.dukat,
  ]
}

fn get_extended_characters() -> List(Character) {
  [
    character.keiko_obrien,
    character.winn,
    character.bareil,
    character.michael_eddington,
    character.kasidy_yates,
    character.leeta,
    character.gowron,
    character.martok,
    character.shakaar,
    character.ziyal,
    character.damar,
  ]
}

fn get_organizations() -> List(Organization) {
  [
    organization.Federation(role.Starfleet(role.Operations)),
    organization.TrillSymbiosisCommission,
    organization.Bajor,
    organization.Prophets,
    organization.CardassianUnion,
    organization.FerengiAlliance,
    organization.KlingonEmpire,
    organization.Maquis,
    organization.DominionForces,
    organization.MirrorUniverse,
  ]
}

// VIEW ------------------------------------------------------------------------

pub fn view(model: Model) -> Element(Msg) {
  html.div([], [
    html.div([attribute.class("drawer lg:drawer-open")], [
      html.input([
        attribute.type_("checkbox"),
        attribute.id("main-drawer"),
        attribute.class("drawer-toggle"),
      ]),

      html.div([attribute.class("drawer-content flex flex-col gap-6")], [
        html.div([attribute.class("lg:hidden p-4")], [
          html.label(
            [
              attribute.for("main-drawer"),
              attribute.class("btn btn-primary drawer-button"),
              attribute.attribute("aria-label", "open sidebar"),
            ],
            [text("☰ Menu")],
          ),
        ]),
        // main contents
        view_main_histogram(model.episodes),
        view_episode_table_section(model.episodes),
      ]),

      html.div([attribute.class("drawer-side")], [
        html.label(
          [
            attribute.for("main-drawer"),
            attribute.class("drawer-overlay"),
            attribute.attribute("aria-label", "close sidebar"),
          ],
          [],
        ),
        view_sidebar_menu(model.episodes),
      ]),
    ]),
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

fn view_sidebar_menu(episodes: List(Episode)) -> Element(Msg) {
  let base_character_items =
    get_characters()
    |> list.map(fn(character) {
      let char_episodes = episode.get_character_episodes(character, episodes)
      html.li([], [
        html.div([attribute.class("flex flex-col gap-2")], [
          html.div([attribute.class("text-sm font-medium text-base-content")], [
            text(character.name),
          ]),
          histogram.view(character.character_hue(character), char_episodes),
        ]),
      ])
    })

  let extended_character_items =
    get_extended_characters()
    |> list.map(fn(character) {
      let char_episodes = episode.get_character_episodes(character, episodes)
      html.li([], [
        html.div([attribute.class("flex flex-col gap-2")], [
          html.div([attribute.class("text-sm font-medium text-base-content")], [
            text(character.name),
          ]),
          histogram.view(character.character_hue(character), char_episodes),
        ]),
      ])
    })

  let organization_items =
    get_organizations()
    |> list.map(fn(org) {
      let org_episodes = episode.get_organization_episodes(org, episodes)
      html.li([], [
        html.div([attribute.class("flex flex-col gap-2")], [
          html.div([attribute.class("text-sm font-medium text-base-content")], [
            text(organization.to_string(org)),
          ]),
          histogram.view(organization.to_hue(org), org_episodes),
        ]),
      ])
    })

  html.ul([attribute.class("menu bg-base-200 min-h-full w-80 p-4")], [
    html.li([], [
      html.h2([attribute.class("menu-title")], [text("Characters")]),
      html.ul([], base_character_items),
    ]),
    html.li([], [
      html.h2([attribute.class("menu-title")], [
        text("More Characters"),
      ]),
      html.ul([], extended_character_items),
    ]),
    html.li([], [
      html.h2([attribute.class("menu-title")], [text("Organizations")]),
      html.ul([], organization_items),
    ]),
  ])
}

fn view_episode_table_section(episodes: List(Episode)) -> Element(Msg) {
  html.div([attribute.class("section")], [episode_table.view(episodes)])
}
