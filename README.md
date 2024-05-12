# gledo

[![Package Version](https://img.shields.io/hexpm/v/gledo)](https://hex.pm/packages/gledo)
[![Hex Docs](https://img.shields.io/badge/hex-docs-ffaff3)](https://hexdocs.pm/gledo/)

Gleam decode Option

```sh
gleam add gledo
```

```gleam
import gledo

pub fn main() {
  Some(123) |> dynamic.from |> gledo.decode_option // Ok(Some(123))

  None |> dynamic.from |> gledo.decode_option // Ok(None)

  123 |> dynamic.from |> gledo.decode_option // Error([DecodeError("Option", "Int", [])])
}
```

Further documentation can be found at <https://hexdocs.pm/gledo>.

## Why not stdlib dynamic.optional?

`dynamic.optional` from stdlib has permissive design and will successfully decode any value.<br/>
If need to have strict decoding for `Option` value only, feel free to use **gledo**

## Development

```sh
gleam run   # Run the project
gleam test  # Run the tests
gleam shell # Run an Erlang shell
```
