# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :phx_api,
  ecto_repos: [PhxApi.Repo]

# Configures the endpoint
config :phx_api, PhxApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "8tJRIn1ULK3GVowcFlVvDh2w34bGzFNhBD5hkC9ijfy89Nbsavb8HAR13QBRc/nA",
  render_errors: [view: PhxApiWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: PhxApi.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
