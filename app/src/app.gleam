import components/episode_table
import components/histogram
import components/ui/menu.{type MenuItem}
import gleam/list
import gleam/result
import lustre
import lustre/attribute
import lustre/effect.{type Effect}
import lustre/element.{type Element}
import lustre/element/html.{text}
import lustre/event
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
  Model(episodes: List(Episode), current_view: CurrentView)
}

pub type CurrentView {
  HomeView
  CharacterView(character: Character)
  OrganizationView(organization: Organization)
}

pub fn init(_) -> #(Model, Effect(Msg)) {
  let model = Model(episodes: [], current_view: HomeView)
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
  NavigateToHome
  NavigateToCharacter(character: Character)
  NavigateToOrganization(organization: Organization)
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
    NavigateToHome -> #(Model(..model, current_view: HomeView), effect.none())
    NavigateToCharacter(character) -> #(
      Model(..model, current_view: CharacterView(character)),
      effect.none(),
    )
    NavigateToOrganization(organization) -> #(
      Model(..model, current_view: OrganizationView(organization)),
      effect.none(),
    )
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
        view_breadcrumbs(model.current_view),
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
) -> List(MenuItem(Msg)) {
  characters
  |> list.map(fn(character) {
    let char_episodes = episode.get_character_episodes(character, episodes)
    menu.menu_item(
      character.name,
      character.character_hue(character),
      char_episodes,
      NavigateToCharacter(character),
    )
  })
}

fn get_organization_menu_items(
  organizations: List(Organization),
  episodes: List(Episode),
) -> List(MenuItem(Msg)) {
  organizations
  |> list.map(fn(org) {
    let org_episodes = episode.get_organization_episodes(org, episodes)
    menu.menu_item(
      organization.to_string(org),
      organization.to_hue(org),
      org_episodes,
      NavigateToOrganization(org),
    )
  })
}

fn view_breadcrumbs(current_view: CurrentView) -> Element(Msg) {
  let home_link =
    html.li([], [
      html.a(
        [
          event.on_click(NavigateToHome),
          attribute.class("cursor-pointer hover:text-primary"),
        ],
        [html.text("Home")],
      ),
    ])

  let second_level_item =
    html.li([], [
      text(case current_view {
        HomeView -> "Deep Space Nine"
        CharacterView(character) -> character.name
        OrganizationView(organization) -> organization.to_string(organization)
      }),
    ])

  html.div([attribute.class("breadcrumbs text-sm")], [
    html.ul([], [home_link, second_level_item]),
  ])
}

fn view_main_histogram(model: Model) -> Element(Msg) {
  case model.current_view {
    HomeView -> {
      let episodes_data =
        model.episodes
        |> list.map(fn(ep) {
          histogram.SeasonImportance(
            season: ep.season,
            episode: ep.episode,
            importance: ep.importance,
          )
        })
      histogram.large_view(175, episodes_data)
    }
    CharacterView(character) -> {
      let char_episodes =
        episode.get_character_episodes(character, model.episodes)
      histogram.large_view(character.character_hue(character), char_episodes)
    }
    OrganizationView(organization) -> {
      let org_episodes =
        episode.get_organization_episodes(organization, model.episodes)
      histogram.large_view(organization.to_hue(organization), org_episodes)
    }
  }
}
