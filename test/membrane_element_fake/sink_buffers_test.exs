defmodule Membrane.Element.Fake.Sink.BuffersTest do
  use ExUnit.Case
  @module Membrane.Element.Fake.Sink.Buffers

  describe "handle_play/1 should" do
    test "return an :ok result with demand" do
      state = nil
      assert @module.handle_play(state) == {{:ok, demand: :sink}, state}
    end
  end

  describe "handle_write/1 should" do
    test "ignore incoming data and return an :ok result with demand" do
      state = nil
      assert @module.handle_write1(:sink, nil, nil, state) == {{:ok, demand: :sink}, state}
    end
  end
end
