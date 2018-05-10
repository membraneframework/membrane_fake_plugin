defmodule Membrane.Element.Fake.Sink.Buffers do
  @moduledoc """
  Fake sink that ignores coming data. It makes demands in buffers.
  """

  use Membrane.Element.Base.Sink

  def_known_sink_pads sink: {:always, {:pull, demand_in: :buffers}, :any}

  @impl true
  def handle_init(_) do
    {:ok, nil}
  end

  @impl true
  def handle_play(state) do
    {{:ok, demand: :sink}, state}
  end

  @impl true
  def handle_write1(:sink, _, _, state) do
    {{:ok, demand: :sink}, state}
  end
end
