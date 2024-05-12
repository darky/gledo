import gleam/dynamic.{type DecodeError, type Dynamic, DecodeError}
import gleam/option.{type Option, None, Some}

pub fn decode_option(
  for_decode: Dynamic,
) -> Result(Option(Dynamic), List(DecodeError)) {
  let assert Ok(decoded) = dynamic.optional(dynamic.dynamic)(for_decode)
  case decoded {
    Some(_) as decoded -> {
      case for_decode == dynamic.from(decoded) {
        True -> Ok(decoded)
        False ->
          Error([DecodeError("Option", dynamic.classify(for_decode), [])])
      }
    }
    None -> Ok(decoded)
  }
}
