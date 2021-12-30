defmodule Membrane.Fake.Sink.BuffersTest do
  use ExUnit.Case
  @module Membrane.Fake.Sink.Buffers

  describe "handle_prepared_to_playing/2 should" do
    test "return an :ok result with demand" do
      state = nil
      assert @module.handle_prepared_to_playing(nil, state) == {{:ok, demand: :input}, state}
    end
  end

  describe "handle_write_list/4 should" do
    test "ignore incoming data and return an :ok result with demand" do
      state = nil

      assert @module.handle_write_list(:input, 1..10 |> Enum.to_list(), nil, state) ==
               {{:ok, demand: {:input, 10}}, state}
    end
  end
end
