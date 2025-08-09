import gleam/json
import rsvp

pub type AppError {
  HttpRequestError(rsvp.Error)
  JsonDecodeError(json.DecodeError)
  UnknownCharacterError(name: String)
  UnknownOrganizationError(name: String)
  DataProcessingError(message: String)
}

pub fn to_string(error: AppError) -> String {
  case error {
    HttpRequestError(rsvp_error) ->
      "HTTP request failed: " <> rsvp_error_to_string(rsvp_error)
    JsonDecodeError(json_error) ->
      "JSON decode failed: " <> json_error_to_string(json_error)
    UnknownCharacterError(name) -> "Unknown character: " <> name
    UnknownOrganizationError(name) -> "Unknown organization: " <> name
    DataProcessingError(message) -> "Data processing error: " <> message
  }
}

fn rsvp_error_to_string(error: rsvp.Error) -> String {
  case error {
    rsvp.BadBody -> "Bad response body"
    rsvp.BadUrl(url) -> "Invalid URL: " <> url
    rsvp.HttpError(_) -> "HTTP error response"
    rsvp.JsonError(_) -> "JSON parsing error"
    rsvp.NetworkError -> "Network connection error"
    rsvp.UnhandledResponse(_) -> "Unhandled response format"
  }
}

fn json_error_to_string(error: json.DecodeError) -> String {
  case error {
    json.UnexpectedEndOfInput -> "Unexpected end of JSON input"
    json.UnexpectedByte(_) -> "Unexpected byte in JSON"
    json.UnexpectedSequence(_) -> "Unexpected sequence in JSON"
    json.UnableToDecode(_) -> "Unable to decode JSON"
  }
}

pub fn log_error(error: AppError) -> Nil {
  let message = to_string(error)
  // TODO: Replace with proper logging when available
  // For now, we'll use a simple approach that works in browser console
  case error {
    UnknownCharacterError(_) | UnknownOrganizationError(_) -> {
      // Log unknown data errors for debugging
      log_warning(message)
    }
    _ -> {
      log_error_internal(message)
    }
  }
}

@external(javascript, "../ffi/console.mjs", "logWarning")
fn log_warning(message: String) -> Nil

@external(javascript, "../ffi/console.mjs", "logError")
fn log_error_internal(message: String) -> Nil
