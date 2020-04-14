# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :cookpad,
  ecto_repos: [Cookpad.Repo]

# Configures the endpoint
config :cookpad, CookpadWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "NMehBT14n3CpWpxmTOAlV6Olvn6i1WCPWjv+k70q1YtNdeEVsLswYyCfDTMlbiN8",
  render_errors: [view: CookpadWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Cookpad.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "iSFTx0y1"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Slime
config :phoenix, :template_engines,
  slim: PhoenixSlime.Engine,
  slime: PhoenixSlime.Engine,
  # If you want to use LiveView
  slimleex: PhoenixSlime.LiveViewEngine

config :phoenix_slime, :use_slim_extension, true

# Locales
config :cookpad, CookpadWeb.Gettext, default_locale: "ru", locales: ~w(en ru)

# Honeybadger
config :honeybadger, api_key: "9f360d3f"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
