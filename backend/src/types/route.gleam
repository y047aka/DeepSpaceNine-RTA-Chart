import gleam/uri.{type Uri}
import types/character.{type Character}
import types/organization.{type Organization}

/// Route type that represents all possible pages in our application
pub type Route {
  Home
  Character(character: Character)
  Organization(organization: Organization)
  NotFound(uri: Uri)
}
