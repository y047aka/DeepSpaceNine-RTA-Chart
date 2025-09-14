import components/histogram
import gleam/list
import lustre/attribute
import lustre/element.{type Element}
import lustre/element/html.{text}

// TYPES ----------------------------------------------------------------------
pub type MenuItem {
  MenuItem(
    name: String,
    hue_var: String,
    episodes: List(histogram.SeasonImportance),
    url: String,
  )
}

pub fn menu_section(title: String, items: List(MenuItem)) -> MenuSection {
  MenuSection(title: title, items: items)
}

pub type MenuSection {
  MenuSection(title: String, items: List(MenuItem))
}

pub fn menu_item(
  name: String,
  hue_var: String,
  episodes: List(histogram.SeasonImportance),
  url: String,
) -> MenuItem {
  MenuItem(name: name, hue_var: hue_var, episodes: episodes, url: url)
}

// VIEW ----------------------------------------------------------------------

pub fn view(sections: List(MenuSection)) -> Element(msg) {
  html.ul(
    [attribute.class("menu bg-base-200 min-h-full w-80 p-4")],
    list.map(sections, view_menu_section),
  )
}

fn view_menu_section(section: MenuSection) -> Element(msg) {
  html.li([], [
    html.h2([attribute.class("menu-title")], [text(section.title)]),
    html.ul([], list.map(section.items, view_menu_item)),
  ])
}

fn view_menu_item(item: MenuItem) -> Element(msg) {
  html.li([], [
    html.a(
      [
        attribute.href(item.url),
        attribute.class(
          "flex flex-col items-start gap-2 cursor-pointer hover:bg-base-300 p-2 rounded",
        ),
      ],
      [
        html.div(
          [
            attribute.class("text-sm font-medium text-base-content text-left"),
          ],
          [text(item.name)],
        ),
        histogram.view(item.hue_var, item.episodes),
      ],
    ),
  ])
}
