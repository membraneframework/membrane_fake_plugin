# Membrane Fake Plugin

[![Hex.pm](https://img.shields.io/hexpm/v/membrane_fake_plugin.svg)](https://hex.pm/packages/membrane_fake_plugin)
[![API Docs](https://img.shields.io/badge/api-docs-yellow.svg?style=flat)](https://hexdocs.pm/membrane_fake_plugin)
[![CircleCI](https://circleci.com/gh/membraneframework/membrane_fake_plugin.svg?style=svg)](https://circleci.com/gh/membraneframework/membrane_fake_plugin)

This package provides fake sink elements that consume & drop incoming data.
They are particularly useful for testing or when making a filter-oriented pipeline.

It comes in 2 variants: `Membrane.Fake.Sink.Buffers` and
`Membrane.Fake.Sink.Bytes` which differ in units they use when making demands.

It is part of [Membrane Multimedia Framework](https://membraneframework.org).

## Installation

Add the following line to your `deps` in `mix.exs`.  Run `mix deps.get`.

```elixir
	{:membrane_fake_plugin, "~> 0.11.0"}
```

## Sample Usage

```elixir
defmodule Fake.Pipeline do
  use Membrane.Pipeline
  alias Membrane.{File, Fake}

  @impl true
  def handle_init(_) do    
    links = [child(:file_src,%File.Source{location: "/tmp/some_samples.raw"}) |> child(:fake_sink, Fake.Sink.Buffers)]

    {[spec: links], %{}}
  end
end
```

## Copyright and License

Copyright 2018, [Software Mansion](https://swmansion.com/?utm_source=git&utm_medium=readme&utm_campaign=membrane_fake_plugin)

[![Software Mansion](https://logo.swmansion.com/logo?color=white&variant=desktop&width=200&tag=membrane-github)](https://swmansion.com/?utm_source=git&utm_medium=readme&utm_campaign=membrane_fake_plugin)

Licensed under the [Apache License, Version 2.0](LICENSE)
