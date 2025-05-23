# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :polar,
  ecto_repos: [Polar.Repo],
  generators: [timestamp_type: :utc_datetime]

# Configures the endpoint
config :polar, PolarWeb.Endpoint,
  url: [host: "localhost"],
  adapter: Bandit.PhoenixAdapter,
  render_errors: [
    formats: [html: PolarWeb.ErrorHTML, json: PolarWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: Polar.PubSub,
  live_view: [signing_salt: "6+7J6KBp"]

config :inertia,
  endpoint: PolarWeb.Endpoint,
  camelize_props: true,
  ssr: true

# Configure tailwind (the version is required)
config :tailwind,
  version: "4.1.4",
  path: System.find_executable("tailwindcss"),
  polar: [
    args: ~w(
          --input=assets/tailwind.css
          --output=priv/static/assets/tailwind.css
          --minify
        ),
    cd: Path.expand("..", __DIR__)
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
