import gleam/list
import gleam/option.{type Option, None, Some}
import lustre/attribute
import lustre/element.{type Element}
import lustre/element/html.{text}
import lustre/event

// TYPES ----------------------------------------------------------------------

pub type BreadcrumbItem(msg) {
  BreadcrumbItem(label: String, click_msg: Option(msg))
}

pub fn breadcrumb_item(
  label: String,
  click_msg: Option(msg),
) -> BreadcrumbItem(msg) {
  BreadcrumbItem(label: label, click_msg: click_msg)
}

// VIEW -----------------------------------------------------------------------

pub fn view(items: List(BreadcrumbItem(msg))) -> Element(msg) {
  html.div([attribute.class("breadcrumbs text-sm")], [
    html.ul([], list.map(items, view_breadcrumb_item)),
  ])
}

fn view_breadcrumb_item(item: BreadcrumbItem(msg)) -> Element(msg) {
  html.li([], [
    case item.click_msg {
      Some(msg) ->
        html.a(
          [
            event.on_click(msg),
            attribute.class("cursor-pointer hover:text-primary"),
          ],
          [text(item.label)],
        )

      None -> text(item.label)
    },
  ])
}
