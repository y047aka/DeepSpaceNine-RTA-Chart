import components/episode_table
import components/histogram
import components/ui/breadcrumbs
import components/ui/menu
import gleam/dynamic/decode
import gleam/list
import gleam/option.{None, Some}
import gleam/result
import lustre
import lustre/attribute
import lustre/effect.{type Effect}
import lustre/element.{type Element}
import lustre/element/html.{text}
import modem
import rsvp
import types/character.{type Character}
import types/episode.{type Episode}
import types/error
import types/organization.{type Organization}
import types/role
import types/route.{type Route}

// MAIN ------------------------------------------------------------------------

pub fn main() {
  let app = lustre.application(init, update, view)
  let assert Ok(_) = lustre.start(app, "#app", Nil)

  Nil
}

// MODEL -----------------------------------------------------------------------

pub type Model {
  Model(route: Route, episodes: List(Episode), histograms: List(Histogram))
}

pub type Histogram {
  Histogram(route: Route, data: List(histogram.SeasonImportance))
}

pub fn init(_) -> #(Model, Effect(Msg)) {
  let route = case modem.initial_uri() {
    Ok(uri) -> route.parse_route(uri)
    Error(_) -> route.Home
  }

  let model = Model(route: route, episodes: [], histograms: [])

  let effect =
    effect.batch([
      fetch_episodes(on_response: LoadedEpisodes),
      fetch_histograms(on_response: LoadedHistograms),
      modem.init(fn(uri) {
        uri
        |> route.parse_route
        |> UserNavigatedTo
      }),
    ])

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

fn fetch_histograms(
  on_response handle_response: fn(Result(List(Histogram), error.AppError)) ->
    msg,
) -> Effect(msg) {
  let url = "./priv/static/histograms.json"
  let handler =
    rsvp.expect_json(histograms_decoder(), fn(result) {
      result
      |> result.map_error(error.HttpRequestError)
      |> handle_response
    })

  rsvp.get(url, handler)
}

// JSON Decoders ---------------------------------------------------------------

fn histograms_decoder() -> decode.Decoder(List(Histogram)) {
  decode.list(histogram_decoder())
}

fn histogram_decoder() -> decode.Decoder(Histogram) {
  use route <- decode.field("route", route_decoder())
  use data <- decode.field("data", decode.list(season_importance_decoder()))
  decode.success(Histogram(route: route, data: data))
}

fn route_decoder() -> decode.Decoder(Route) {
  use type_str <- decode.field("type", decode.string)
  case type_str {
    "home" -> decode.success(route.Home)
    "character" -> {
      use char_id <- decode.field("id", decode.string)
      case character.from_id(char_id) {
        Ok(char) -> decode.success(route.Character(char))
        Error(_) -> decode.success(route.Home)
        // fallback
      }
    }
    "organization" -> {
      use org_id <- decode.field("id", decode.string)
      case organization.from_id(org_id) {
        Ok(org) -> decode.success(route.Organization(org))
        Error(_) -> decode.success(route.Home)
        // fallback
      }
    }
    _ -> decode.success(route.Home)
    // fallback for unknown types
  }
}

fn season_importance_decoder() -> decode.Decoder(histogram.SeasonImportance) {
  use season <- decode.field("season", decode.int)
  use episode <- decode.field("episode", decode.int)
  use importance <- decode.field("importance", decode.int)
  decode.success(histogram.SeasonImportance(
    season: season,
    episode: episode,
    importance: importance,
  ))
}

// UPDATE ----------------------------------------------------------------------

pub type Msg {
  UserNavigatedTo(route: Route)
  LoadedEpisodes(Result(List(Episode), error.AppError))
  LoadedHistograms(Result(List(Histogram), error.AppError))
}

pub fn update(model: Model, msg: Msg) -> #(Model, Effect(Msg)) {
  case msg {
    UserNavigatedTo(route) -> {
      #(Model(..model, route: route), effect.none())
    }
    LoadedEpisodes(Ok(episodes)) -> #(
      Model(..model, episodes: episodes),
      effect.none(),
    )
    LoadedEpisodes(Error(app_error)) -> {
      error.log_error(app_error)
      #(model, effect.none())
    }
    LoadedHistograms(Ok(histograms)) -> {
      #(Model(..model, histograms: histograms), effect.none())
    }
    LoadedHistograms(Error(app_error)) -> {
      error.log_error(app_error)
      // Histograms are already built in LoadedEpisodes
      #(model, effect.none())
    }
  }
}

// VIEW ------------------------------------------------------------------------

pub fn view(model: Model) -> Element(Msg) {
  html.div([attribute.attribute("data-theme", "dark")], [
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
        view_breadcrumbs(model.route),
        view_main_histogram(model),
        episode_table.view(model.episodes),
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
        view_sidebar(model.episodes),
      ]),
    ]),
  ])
}

fn view_sidebar(episodes: List(Episode)) -> Element(Msg) {
  let characters =
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
    |> get_character_menu_items(episodes)

  let more_characters =
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
    |> get_character_menu_items(episodes)

  let organizations =
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
    |> get_organization_menu_items(episodes)

  menu.view([
    menu.menu_section("Characters", characters),
    menu.menu_section("More Characters", more_characters),
    menu.menu_section("Organizations", organizations),
  ])
}

fn get_character_menu_items(
  characters: List(Character),
  episodes: List(Episode),
) -> List(menu.MenuItem) {
  characters
  |> list.map(fn(character) {
    let char_episodes = episode.get_character_episodes(character, episodes)
    menu.menu_item(
      character.name,
      character.character_hue(character),
      char_episodes,
      route.to_string(route.Character(character)),
    )
  })
}

fn get_organization_menu_items(
  organizations: List(Organization),
  episodes: List(Episode),
) -> List(menu.MenuItem) {
  organizations
  |> list.map(fn(org) {
    let org_episodes = episode.get_organization_episodes(org, episodes)
    menu.menu_item(
      organization.to_string(org),
      organization.to_hue(org),
      org_episodes,
      route.to_string(route.Organization(org)),
    )
  })
}

fn view_breadcrumbs(current_route: Route) -> Element(Msg) {
  breadcrumbs.view(case current_route {
    route.Home -> [
      breadcrumbs.breadcrumb_item("Home", Some(route.to_string(route.Home))),
    ]
    route.Character(char) -> [
      breadcrumbs.breadcrumb_item("Home", Some(route.to_string(route.Home))),
      breadcrumbs.breadcrumb_item("Characters", None),
      breadcrumbs.breadcrumb_item(char.name, None),
    ]
    route.Organization(org) -> [
      breadcrumbs.breadcrumb_item("Home", Some(route.to_string(route.Home))),
      breadcrumbs.breadcrumb_item("Organizations", None),
      breadcrumbs.breadcrumb_item(organization.to_string(org), None),
    ]
    route.NotFound(_) -> [
      breadcrumbs.breadcrumb_item("Home", Some(route.to_string(route.Home))),
      breadcrumbs.breadcrumb_item("Not Found", None),
    ]
  })
}

fn view_main_histogram(model: Model) -> Element(Msg) {
  // Hue depends on the current route, but data is shared.
  case
    model.route,
    model.histograms
    |> list.find(fn(h) { h.route == model.route })
    |> result.map(fn(h) { h.data })
  {
    route.Home, Ok(data) -> histogram.large_view(175, data)
    route.Character(character), Ok(data) ->
      histogram.large_view(character.character_hue(character), data)
    route.Organization(organization), Ok(data) ->
      histogram.large_view(organization.to_hue(organization), data)
    _, _ -> text("Not found")
  }
}
