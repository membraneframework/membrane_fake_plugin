defmodule Membrane.Fake.Sink.BuffersTest do
  use ExUnit.Case
  @module Membrane.Fake.Sink.Buffers

  describe "handle_prepared_to_playing/2 should" do
    test "return an :ok result with demand" do
      state = nil
      assert @module.handle_playing(nil, state) == {[demand: :input], state}
    end
  end

  describe "handle_buffer/4 should" do
    test "ignore incoming data and return an :ok result with demand" do
      state = nil

      assert @module.handle_buffer(:input, 1, nil, state) ==
               {[demand: {:input, 1}], state}
    end
  end
end
