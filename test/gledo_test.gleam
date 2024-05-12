import gleam/dynamic.{DecodeError}
import gleam/option.{None, Some}
import gledo
import gleeunit
import gleeunit/should

pub fn main() {
  gleeunit.main()
}

pub fn optional_permissive_proof_test() {
  123
  |> dynamic.from
  |> dynamic.optional(dynamic.dynamic)
  |> should.equal(Ok(Some(dynamic.from(123))))
}

pub fn decode_some_test() {
  Some(123)
  |> dynamic.from
  |> gledo.decode_option
  |> should.equal(
    Some(123)
    |> dynamic.from
    |> Ok,
  )
}

pub fn decode_none_test() {
  None
  |> dynamic.from
  |> gledo.decode_option
  |> should.equal(
    None
    |> dynamic.from
    |> Ok,
  )
}

pub fn decode_int_test() {
  123
  |> dynamic.from
  |> gledo.decode_option
  |> should.equal(Error([DecodeError("Option", "Int", [])]))
}
