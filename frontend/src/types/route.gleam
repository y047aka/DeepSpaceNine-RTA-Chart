import gleam/uri.{type Uri}
import lustre/attribute.{type Attribute}
import types/character.{type Character}
import types/organization.{type Organization}

/// Route type that represents all possible pages in our application
pub type Route {
  Home
  Character(character: Character)
  Organization(organization: Organization)
  NotFound(uri: Uri)
}

/// Parse a URI into our application's Route type
pub fn parse_route(uri: Uri) -> Route {
  case uri.path_segments(uri.path) {
    [] | [""] -> Home
    ["character", id] -> {
      case character.from_id(id) {
        Ok(char) -> Character(char)
        Error(_) -> NotFound(uri)
      }
    }
    ["organization", id] -> {
      case organization.from_id(id) {
        Ok(org) -> Organization(org)
        Error(_) -> NotFound(uri)
      }
    }
    _ -> NotFound(uri)
  }
}

/// Convert a Route back to an href attribute for use in links
pub fn href(route: Route) -> Attribute(msg) {
  let url = to_string(route)
  attribute.href(url)
}

/// Convert a Route to a string representation
pub fn to_string(route: Route) -> String {
  case route {
    Home -> "/"
    Character(char) -> "/character/" <> char.id
    Organization(org) -> "/organization/" <> organization.to_id(org)
    NotFound(_) -> "/404"
  }
}
