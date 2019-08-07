defmodule Membrane.Element.Fake.Sink.Bytes do
  @moduledoc """
  Fake sink that ignores coming data. It makes demands in bytes.
  """

  use Membrane.Sink

  def_options demand_size: [
                type: :integer,
                spec: pos_integer(),
                description: "Amount of bytes demanded on each write",
                default: 2048
              ]

  def_input_pad :input, demand_unit: :bytes, caps: :any

  @impl true
  def handle_prepared_to_playing(_ctx, state) do
    {{:ok, demand: {:input, state.demand_size}}, state}
  end

  @impl true
  def handle_write_list(:input, _buffers, _ctx, state) do
    {{:ok, demand: {:input, state.demand_size}}, state}
  end
end
