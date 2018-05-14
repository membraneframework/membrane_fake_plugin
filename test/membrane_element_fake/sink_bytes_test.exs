defmodule Membrane.Element.Fake.Sink.BytesTest do
  use ExUnit.Case
  @module Membrane.Element.Fake.Sink.Bytes

  test "handle_init/1 should store demand_size in state" do
    assert @module.handle_init(%@module{demand_size: 42}) == {:ok, %{demand_size: 42}}
  end

  def state(_), do: [state: %{demand_size: 42}]

  describe "With demand size set to 42" do
    setup [:state]

    test "handle_play/1 should return an :ok result with demand of size 42", %{state: state} do
      assert @module.handle_play(state) == {{:ok, demand: {:sink, 42}}, state}
    end

    test "handle_write/4 should ignore incoming data and return an :ok result with demand of size 42",
         %{state: state} do
      assert @module.handle_write1(:sink, nil, nil, state) == {{:ok, demand: {:sink, 42}}, state}
    end
  end
end
