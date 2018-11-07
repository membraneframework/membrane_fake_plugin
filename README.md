# Membrane Multimedia Framework: Fake Element

[![Build Status](https://travis-ci.com/membraneframework/membrane-element-fake.svg?branch=master)](https://travis-ci.com/membraneframework/membrane-element-fake)

This package provides fake sink elements that consume & drop incoming data.
They are particularly useful for testing or when making a filter-oriented pipeline.

It comes in 2 variants: `Membrane.Element.Fake.Sink.Buffers` and
`Membrane.Element.Fake.Sink.Bytes` which differ in units they use when making demands.

It is part of [Membrane Multimedia Framework](https://membraneframework.org).

## Installation

Add the following line to your `deps` in `mix.exs`.  Run `mix deps.get`.

```elixir
{:membrane_element_fake, "~> 0.1"}
```

## Sample Usage

```elixir
defmodule Fake.Pipeline do
  use Membrane.Pipeline
  alias Pipeline.Spec
  alias Membrane.Element.{File, Fake}

  @impl true
  def handle_init(_) do
    children = [
      file_src: %File.Source{location: "/tmp/some_samples.raw"},
      fake_sink: Fake.Sink.Buffers,
    ]
    links = %{
      {:file_src, :output} => {:fake_sink, :input}
    }

    {{:ok, %Spec{children: children, links: links}}, %{}}
  end
end
```

## Copyright and License

Copyright 2018, [Software Mansion](https://swmansion.com/?utm_source=git&utm_medium=readme&utm_campaign=membrane)

[![Software Mansion](https://membraneframework.github.io/static/logo/swm_logo_readme.png)](https://swmansion.com/?utm_source=git&utm_medium=readme&utm_campaign=membrane)

Licensed under the [Apache License, Version 2.0](LICENSE)
