import components/histogram
import gleam/list
import lustre/attribute
import lustre/element.{type Element}
import lustre/element/html.{text}
import lustre/event

// TYPES ----------------------------------------------------------------------
pub type MenuItem(msg) {
  MenuItem(
    name: String,
    hue: Int,
    episodes: List(histogram.SeasonImportance),
    click_msg: msg,
  )
}

pub fn menu_section(
  title: String,
  items: List(MenuItem(msg)),
) -> MenuSection(msg) {
  MenuSection(title: title, items: items)
}

pub type MenuSection(msg) {
  MenuSection(title: String, items: List(MenuItem(msg)))
}

pub fn menu_item(
  name: String,
  hue: Int,
  episodes: List(histogram.SeasonImportance),
  click_msg: msg,
) -> MenuItem(msg) {
  MenuItem(name: name, hue: hue, episodes: episodes, click_msg: click_msg)
}

// VIEW ----------------------------------------------------------------------

pub fn view(sections: List(MenuSection(msg))) -> Element(msg) {
  html.ul(
    [attribute.class("menu bg-base-200 min-h-full w-80 p-4")],
    list.map(sections, view_menu_section),
  )
}

fn view_menu_section(section: MenuSection(msg)) -> Element(msg) {
  html.li([], [
    html.h2([attribute.class("menu-title")], [text(section.title)]),
    html.ul([], list.map(section.items, view_menu_item)),
  ])
}

fn view_menu_item(item: MenuItem(msg)) -> Element(msg) {
  html.li([], [
    html.div(
      [
        attribute.class(
          "flex flex-col items-start gap-2 cursor-pointer hover:bg-base-300 p-2 rounded",
        ),
        event.on_click(item.click_msg),
      ],
      [
        html.div(
          [
            attribute.class("text-sm font-medium text-base-content text-left"),
          ],
          [text(item.name)],
        ),
        histogram.view(item.hue, item.episodes),
      ],
    ),
  ])
}
