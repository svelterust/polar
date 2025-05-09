defmodule Polar.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      Polar.Repo,
      {Ecto.Migrator,
       repos: Application.fetch_env!(:polar, :ecto_repos), skip: skip_migrations?()},
      {DNSCluster, query: Application.get_env(:polar, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Polar.PubSub},
      {Inertia.SSR, path: Path.join([Application.app_dir(:polar), "priv"])},
      PolarWeb.Endpoint
    ]

    opts = [strategy: :one_for_one, name: Polar.Supervisor]
    Supervisor.start_link(children, opts)
  end

  @impl true
  def config_change(changed, _new, removed) do
    PolarWeb.Endpoint.config_change(changed, removed)
    :ok
  end

  defp skip_migrations?() do
    System.get_env("RELEASE_NAME") != nil
  end
end
