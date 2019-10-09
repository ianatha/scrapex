defmodule Scrapex.Mixfile do
  use Mix.Project

  @name "Scrapex"
  @project_url "https://github.com/ianatha/scrapex"
  @version "0.2.0"
  @description "Fast and robust web crawling/scraping tool in Elixir"

  def project do
    [
      app: :scrapex,
      version: @version,
      elixir: "~> 1.5",
      source_url: @project_url,
      homepage_url: @project_url,
      description: @description,
      package: package(),
      deps: deps(),
      docs: docs(),
      start_permanent: Mix.env == :prod,
      build_embedded: Mix.env == :prod
    ]
  end

  def application do
    [
      extra_applications: [:logger],
    ]
  end

  defp deps do
    [
      {:exq, "~> 0.13.3"},
      {:httpoison, "~> 1.6", optional: true},
      {:hound, "~> 1.1" , optional: true},
      {:credo, "~> 0.5", only: :dev},
      {:dialyxir, "~> 0.5", only: [:dev, :test], runtime: false},
      {:ex_doc, ">= 0.0.0", only: [:dev, :docs]}
    ]
  end

  defp docs do
    [
      main: "readme",
      extra_section: "GUIDES",
      extras: ["README.md", "guides/examples.md"]
    ]
  end

  defp package do
    [name: :scrapex,
     files: ["lib", "mix.exs", "README*", "config"],
     maintainers: ["Ian Atha", "Pete Matsyburka"],
     licenses: ["MIT"],
     links: %{"GitHub" => @project_url,
              "Docs" => "https://hexdocs.pm/scrapex"}]
  end
end
