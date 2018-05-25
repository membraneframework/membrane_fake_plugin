defmodule Membrane.Element.Fake.Mixfile do
  use Mix.Project

  def project do
    [
      app: :membrane_element_fake,
      compilers: Mix.compilers(),
      version: "0.0.1",
      elixir: "~> 1.6",
      elixirc_paths: elixirc_paths(Mix.env()),
      description: "Membrane Multimedia Framework (Fake Element)",
      package: package(),
      name: "Membrane Element: Fake",
      source_url: "https://github.com/membraneframework/membrane-element-fake",
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [],
      mod: {Membrane.Element.Fake, []}
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp package do
    [
      maintainers: ["Membrane Team"],
      licenses: ["Apache 2.0"]
    ]
  end

  defp deps do
    [
      {:membrane_core, git: "git@github.com:membraneframework/membrane-core.git"}
    ]
  end
end
