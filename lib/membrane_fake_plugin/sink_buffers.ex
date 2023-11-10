defmodule Membrane.Fake.Sink.Buffers do
  @moduledoc """
  Fake sink that ignores coming data. It makes demands in buffers.
  """

  use Membrane.Sink

  def_input_pad :input, flow_control: :manual, demand_unit: :buffers, accepted_format: _any

  @impl true
  def handle_playing(_ctx, state) do
    {[demand: :input], state}
  end

  @impl true
  def handle_buffer(:input, _buffer, _ctx, state) do
    {[demand: {:input, 1}], state}
  end
end
