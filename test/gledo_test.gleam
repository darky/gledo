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
    dynamic.from(123)
    |> Some
    |> Ok,
  )
}

pub fn decode_none_test() {
  None
  |> dynamic.from
  |> gledo.decode_option
  |> should.equal(Ok(None))
}

pub fn decode_int_test() {
  123
  |> dynamic.from
  |> gledo.decode_option
  |> should.equal(Error([DecodeError("Option", "Int", [])]))
}
