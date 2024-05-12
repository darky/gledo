import gleam/dynamic.{type DecodeError, type Dynamic, DecodeError}
import gleam/erlang/atom
import gleam/option.{type Option}
import gleam/result
import gluple

pub fn decode_option(x) -> Result(Option(Dynamic), List(DecodeError)) {
  case is_some(x) || is_none(x) {
    True ->
      x
      |> dynamic.from
      |> dynamic.optional(dynamic.dynamic)
    False -> Error([DecodeError("Option", dynamic.classify(x), [])])
  }
}

@external(javascript, "./gledo_ffi.mjs", "isSome")
fn is_some(x: x) -> Bool {
  gluple.tuple_size(x) == Ok(2)
  && {
    x
    |> gluple.tuple_element(0)
    |> result.unwrap(dynamic.from(""))
    |> atom.from_dynamic
  }
  == Ok(atom.create_from_string("some"))
}

@external(javascript, "./gledo_ffi.mjs", "isNone")
fn is_none(x: x) -> Bool {
  x
  |> dynamic.from
  |> atom.from_dynamic
  == Ok(atom.create_from_string("none"))
}
