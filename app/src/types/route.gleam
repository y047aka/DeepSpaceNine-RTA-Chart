import gleam/uri.{type Uri}
import lustre/attribute.{type Attribute}

/// Route type that represents all possible pages in our application
pub type Route {
  Home
  Character(id: String)
  Organization(id: String)
  NotFound(uri: Uri)
}

/// Parse a URI into our application's Route type
pub fn parse_route(uri: Uri) -> Route {
  case uri.path_segments(uri.path) {
    [] | [""] -> Home
    ["character", id] -> Character(id)
    ["organization", id] -> Organization(id)
    _ -> NotFound(uri)
  }
}

/// Convert a Route back to an href attribute for use in links
pub fn href(route: Route) -> Attribute(msg) {
  let url = case route {
    Home -> "/"
    Character(id) -> "/character/" <> id
    Organization(id) -> "/organization/" <> id
    NotFound(_) -> "/404"
  }
  attribute.href(url)
}

/// Convert a Route to a string representation
pub fn to_string(route: Route) -> String {
  case route {
    Home -> "/"
    Character(id) -> "/character/" <> id
    Organization(id) -> "/organization/" <> id
    NotFound(_) -> "/404"
  }
}
