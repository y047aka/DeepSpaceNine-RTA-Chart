import gleam/list
import gleam/option.{type Option, None, Some}
import lustre/attribute
import lustre/element.{type Element}
import lustre/element/html.{text}

// TYPES ----------------------------------------------------------------------

pub type BreadcrumbItem {
  BreadcrumbItem(label: String, url: Option(String))
}

pub fn breadcrumb_item(label: String, url: Option(String)) -> BreadcrumbItem {
  BreadcrumbItem(label: label, url: url)
}

// VIEW -----------------------------------------------------------------------

pub fn view(items: List(BreadcrumbItem)) -> Element(msg) {
  html.div([attribute.class("breadcrumbs text-sm")], [
    html.ul([], list.map(items, view_breadcrumb_item)),
  ])
}

fn view_breadcrumb_item(item: BreadcrumbItem) -> Element(msg) {
  html.li([], [
    case item.url {
      Some(url) ->
        html.a(
          [
            attribute.href(url),
            attribute.class("cursor-pointer hover:text-primary"),
          ],
          [text(item.label)],
        )

      None -> text(item.label)
    },
  ])
}
