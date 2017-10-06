defmodule Membrane.Element.Fake.Sink.Bytes do
  use Membrane.Element.Base.Sink
  def_known_sink_pads %{
    :sink => {:always, {:pull, demand_in: :bytes}, :any}
  }

  def handle_init(_) do
    {:ok, nil}
  end

  def handle_prepare(_, _) do
    {{:ok, demand: {:sink, 65535}}, nil}
  end

  def handle_write1(:sink, %Membrane.Buffer{payload: payload}, _, _) do
    {{:ok, demand: {:sink, byte_size(payload)}}, nil}
  end
end