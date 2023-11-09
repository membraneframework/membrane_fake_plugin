defmodule Membrane.Fake.PipelineTest do
  use ExUnit.Case
  use Membrane.Pipeline

  import Membrane.Testing.Assertions

  alias Membrane.Testing
  alias Membrane.{Fake, File}

  @fixture_path "../fixtures/sample.mpg" |> Path.expand(__DIR__)

  test "Fake Sink consumes sample input" do
    links = [
      child(:file_src, %File.Source{location: @fixture_path})
      |> child(:fake_sink, Fake.Sink.Buffers)
    ]

    assert {:ok, _super_vised, pid} = Testing.Pipeline.start_link(spec: links)

    assert_end_of_stream(pid, :fake_sink)
  end
end
