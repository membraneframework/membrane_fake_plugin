defmodule Membrane.Element.Fake.Mixfile do
  use Mix.Project

  def project do
    [app: :membrane_element_fake,
     compilers: Mix.compilers,
     version: "0.0.1",
     elixir: "~> 1.3",
     elixirc_paths: elixirc_paths(Mix.env),
     description: "Membrane Multimedia Framework (Fake Element)",
     maintainers: ["Jacek Fidos"],
     licenses: ["LGPL"],
     name: "Membrane Element: Fake ",
     source_url: "https://github.com/membraneframework/membrane-element-fake",
     preferred_cli_env: [espec: :test],
     deps: deps()]
  end


  def application do
    [applications: [
      :membrane_core
    ], mod: {Membrane.Element.Fake, []}]
  end


  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_),     do: ["lib",]


  defp deps do
    [
      {:membrane_core, git: "git@github.com:membraneframework/membrane-core.git"},
    ]
  end
end
