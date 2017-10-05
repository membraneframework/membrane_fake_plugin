# Membrane Multimedia Framework: Fake Element

This package provides placeholders for membrane pipeline sink elements. They are particularly useful, when making a lightweight, filter-orientated pipeline.

## Fake.Sink.Bytes

Demands in bytes, ignores incoming data.

## Fake.Sink.Buffers

Demands in buffers, ignores incoming data.

# Usage
## Installation

Add the following line to your `deps` in `mix.exs`.  Run `mix deps.get`.

```elixir
{:membrane_element_fake, git: "git@github.com:membraneframework/membrane-element-fake.git"}
```

Then add the following line to your `applications` in `mix.exs`.

```elixir
:membrane_element_fake
```

# License

[LGPLv3](https://www.gnu.org/licenses/lgpl-3.0.en.html)

# Authors

* Jacek Fidos
