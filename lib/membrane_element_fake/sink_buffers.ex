defmodule Membrane.Element.Fake.Sink.Buffers do
  use Membrane.Element.Base.Sink
  def_known_sink_pads %{
    :sink => {:always, {:pull, demand_in: :buffers}, :any}
  }

  def handle_init(_) do
    {:ok, nil}
  end

  def handle_prepare(_, _) do
    {{:ok, demand: {:sink, 1}, nil}
  end

  def handle_write1(:sink, _, _, _) do
    {{:ok, demand: {:sink, 1}}, nil}
  end
end