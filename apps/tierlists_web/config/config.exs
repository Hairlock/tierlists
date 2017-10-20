# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :tierlists_web,
  namespace: TierlistsWeb,
  ecto_repos: [Tierlists.Repo]

# Configures the endpoint
config :tierlists_web, TierlistsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "j+58oLNmSRYzErsxxG8jYMQBoxRT3UuBXL5He1ZgkYibJ8B0qK6l+K57lC4OSFh2",
  render_errors: [view: TierlistsWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: TierlistsWeb.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :tierlists_web, :generators,
  context_app: :tierlists

config :bcrypt_elixir, :log_rounds, 4
config :comeonin, :pbkdf2_rounds, 1

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
