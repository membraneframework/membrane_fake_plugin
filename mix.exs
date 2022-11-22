defmodule Membrane.Fake.Mixfile do
  use Mix.Project

  @version "0.9.0"
  @github_url "https://github.com/membraneframework/membrane_fake_plugin"

  def project do
    [
      app: :membrane_fake_plugin,
      compilers: Mix.compilers(),
      version: @version,
      elixir: "~> 1.12",
      elixirc_paths: elixirc_paths(Mix.env()),
      deps: deps(),
      dialyzer: dialyzer(),

      # hex
      description: "Fake Membrane sinks that drop incoming data",
      package: package(),

      # docs
      name: "Membrane Fake Plugin",
      source_url: @github_url,
      homepage_url: "https://membraneframework.org",
      docs: docs()
    ]
  end

  def application do
    [
      extra_applications: []
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp docs do
    [
      main: "readme",
      extras: ["LICENSE", "README.md"],
      formatters: ["html"],
      source_ref: "v#{@version}"
    ]
  end

  defp package do
    [
      maintainers: ["Membrane Team"],
      licenses: ["Apache 2.0"],
      links: %{
        "GitHub" => @github_url,
        "Membrane Framework Homepage" => "https://membraneframework.org"
      }
    ]
  end

  defp deps do
    [
      {:membrane_core, "~> 0.11.0"},
      {:ex_doc, "~> 0.28.4", only: :dev, runtime: false},
      {:dialyxir, "~> 1.1", only: :dev, runtime: false},
      {:credo, "~> 1.6.4", only: :dev, runtime: false},
      {:membrane_file_plugin, "~> 0.13.0", only: [:dev, :test]}
    ]
  end

  defp dialyzer() do
    opts = [
      flags: [:error_handling]
    ]

    if System.get_env("CI") == "true" do
      # Store PLTs in cacheable directory for CI
      [plt_local_path: "priv/plts", plt_core_path: "priv/plts"] ++ opts
    else
      opts
    end
  end
end
