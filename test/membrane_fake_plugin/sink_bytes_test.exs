defmodule Membrane.Fake.Sink.BytesTest do
  use ExUnit.Case
  @module Membrane.Fake.Sink.Bytes

  test "handle_init/1 should store demand_size in state" do
    assert @module.handle_init(%@module{demand_size: 42}) == {:ok, %{demand_size: 42}}
  end

  def state(_), do: [state: %{demand_size: 42}]

  describe "With demand size set to 42" do
    setup [:state]

    test "handle_prepared_to_playing/2 should return an :ok result with demand of size 42", %{
      state: state
    } do
      assert @module.handle_prepared_to_playing(nil, state) ==
               {{:ok, demand: {:input, 42}}, state}
    end

    test "handle_write_list/4 should ignore incoming data and return an :ok result with demand of size 42",
         %{state: state} do
      assert @module.handle_write_list(:input, nil, nil, state) ==
               {{:ok, demand: {:input, 42}}, state}
    end
  end
end
