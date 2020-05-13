# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :realtime, RealtimeWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "tL6vNJs78LAG0AyWnlZ5nHA3dpl3Bo4aN0/axKOUenPnZeHQL5pw+gJSkr87UhhJ",
  render_errors: [view: RealtimeWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Realtime.PubSub,
  live_view: [signing_salt: "jAoGiVx9"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
