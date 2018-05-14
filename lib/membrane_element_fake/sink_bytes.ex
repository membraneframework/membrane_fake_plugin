defmodule Membrane.Element.Fake.Sink.Bytes do
  @moduledoc """
  Fake sink that ignores coming data. It makes demands in bytes.
  """

  use Membrane.Element.Base.Sink

  def_options demand_size: [
                type: :integer,
                spec: pos_integer(),
                description: "Amount of bytes demanded on each write",
                default: 2048
              ]

  def_known_sink_pads sink: {:always, {:pull, demand_in: :bytes}, :any}

  @impl true
  def handle_init(%__MODULE__{demand_size: ds}) do
    {:ok, %{demand_size: ds}}
  end

  @impl true
  def handle_play(%{demand_size: ds} = state) do
    {{:ok, demand: {:sink, ds}}, state}
  end

  @impl true
  def handle_write1(:sink, _, _, %{demand_size: ds} = state) do
    {{:ok, demand: {:sink, ds}}, state}
  end
end
