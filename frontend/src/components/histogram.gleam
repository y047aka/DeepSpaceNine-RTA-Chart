import gleam/dict
import gleam/int
import gleam/list
import gleam/result
import lustre/attribute
import lustre/element.{type Element}
import lustre/element/html

pub type Color {
  Color(variable: String)
}

pub type SeasonImportance {
  SeasonImportance(season: Int, episode: Int, importance: Int)
}

fn extract_organization_from_hue_var(hue_var: String) -> Result(String, String) {
  case hue_var {
    "var(--hue-federation)" -> Ok("federation")
    "var(--hue-cardassian)" -> Ok("cardassian")
    "var(--hue-deep-space-nine)" -> Ok("deep-space-nine")
    "var(--hue-bajoran)" -> Ok("bajoran")
    "var(--hue-klingon)" -> Ok("klingon")
    "var(--hue-ferengi)" -> Ok("ferengi")
    "var(--hue-dominion)" -> Ok("dominion")
    "var(--hue-starfleet-command)" -> Ok("starfleet-command")
    "var(--hue-starfleet-science-or-medical)" ->
      Ok("starfleet-science-or-medical")
    "var(--hue-starfleet-operations-or-security)" ->
      Ok("starfleet-operations-or-security")
    "var(--hue-trill)" -> Ok("trill")
    "var(--hue-changeling)" -> Ok("changeling")
    _ -> Error("Unknown hue var: " <> hue_var)
  }
}

pub fn hsl_color(hue_var: String, importance: Int) -> Color {
  let organization = extract_organization_from_hue_var(hue_var)
  let css_var_name =
    organization
    |> result.map(fn(org) { org <> "-" <> int.to_string(importance) })
    |> result.unwrap("unknown")
  Color(variable: "var(--" <> css_var_name <> ")")
}

pub fn colored_cell(background_color: Color) -> Element(msg) {
  html.div(
    [
      attribute.class("histogram-cell"),
      attribute.style("background-color", background_color.variable),
    ],
    [],
  )
}

fn render_histogram_with_class(
  class_name: String,
  hue_var: String,
  episodes: List(SeasonImportance),
) -> Element(msg) {
  let to_color = fn(ep: SeasonImportance) { hsl_color(hue_var, ep.importance) }

  let grouped_episodes = list.group(episodes, fn(ep) { ep.season })

  html.div(
    [attribute.class(class_name)],
    grouped_episodes
      |> dict.to_list
      |> list.sort(fn(a, b) { int.compare(a.0, b.0) })
      |> list.map(fn(season_group) {
        let #(_season, season_episodes) = season_group
        let sorted_episodes =
          season_episodes
          |> list.sort(fn(a, b) { int.compare(a.episode, b.episode) })
        html.div(
          [attribute.class("season")],
          sorted_episodes
            |> list.map(fn(ep) { colored_cell(to_color(ep)) }),
        )
      }),
  )
}

pub fn view(hue_var: String, episodes: List(SeasonImportance)) -> Element(msg) {
  render_histogram_with_class("small-histogram", hue_var, episodes)
}

pub fn large_view(
  hue_var: String,
  episodes: List(SeasonImportance),
) -> Element(msg) {
  render_histogram_with_class("large-histogram", hue_var, episodes)
}
