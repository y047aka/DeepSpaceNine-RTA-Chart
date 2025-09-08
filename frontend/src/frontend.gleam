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
  Histogram(path: List(String), data: List(histogram.SeasonImportance))
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
  use path <- decode.field("path", decode.list(decode.string))
  use data <- decode.field("data", decode.list(season_importance_decoder()))
  decode.success(Histogram(path: path, data: data))
}

fn route_to_path(route: Route) -> List(String) {
  case route {
    route.Home -> []
    route.Character(char) -> ["characters", char.id]
    route.Organization(org) -> ["organizations", organization.to_id(org)]
    route.NotFound(_) -> []
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
        view_sidebar(model.histograms),
      ]),
    ]),
  ])
}

fn view_sidebar(histograms: List(Histogram)) -> Element(Msg) {
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
    |> list.map(fn(char) { get_character_menu_item(char, histograms) })

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
    |> list.map(fn(char) { get_character_menu_item(char, histograms) })

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
    |> list.map(fn(org) { get_organization_menu_item(org, histograms) })

  menu.view([
    menu.menu_section("Characters", characters),
    menu.menu_section("More Characters", more_characters),
    menu.menu_section("Organizations", organizations),
  ])
}

fn get_character_menu_item(
  character: Character,
  histograms: List(Histogram),
) -> menu.MenuItem {
  let char_route = route.Character(character)
  let char_data = get_histogram_data(histograms, char_route)
  menu.menu_item(
    character.name,
    character.character_hue(character),
    char_data,
    route.to_string(char_route),
  )
}

fn get_organization_menu_item(
  organization: Organization,
  histograms: List(Histogram),
) -> menu.MenuItem {
  let org_route = route.Organization(organization)
  let org_data = get_histogram_data(histograms, org_route)
  menu.menu_item(
    organization.to_string(organization),
    organization.to_hue(organization),
    org_data,
    route.to_string(org_route),
  )
}

// Helper function to get histogram data for a specific route
fn get_histogram_data(
  histograms: List(Histogram),
  target_route: Route,
) -> List(histogram.SeasonImportance) {
  let target_path = route_to_path(target_route)
  histograms
  |> list.find(fn(h) { h.path == target_path })
  |> result.map(fn(h) { h.data })
  |> result.unwrap([])
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
  let target_path = route_to_path(model.route)
  case
    model.route,
    model.histograms
    |> list.find(fn(h) { h.path == target_path })
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
