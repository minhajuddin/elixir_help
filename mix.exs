defmodule ElixirHelp.Mixfile do
  use Mix.Project

  @description  "IEx `h` from your cli"
  def project do
    [app: :elixir_help,
     version: "0.1.0",
     elixir: "~> 1.4",
     package: package(),
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: @description,
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    # Specify extra applications you'll use from Erlang/Elixir
    [extra_applications: [:logger],
     mod: {ElixirHelp.Application, []}]
  end

  # Dependencies can be Hex packages:
  #
  #   {:my_dep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:my_dep, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:ex_doc, ">= 0.0.0", only: :dev},
      {:alchemist_server, github: "tonini/alchemist-server"}
    ]
  end

  defp package do
    [
      description: @description,
      files: ~w(lib config mix.exs README.md LICENSE),
      maintainers: ["Khaja Minhajuddin"],
      licenses: ["MIT"],
      links: %{
        "Github" => "http://github.com/minhajuddin/h",
        "Docs"   => "http://hexdocs.pm/h",
      }
    ]
  end
end
