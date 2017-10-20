use Mix.Config

config :tierlists, ecto_repos: [Tierlists.Repo]

config :comeonin, :bcrypt_log_rounds, 4
config :comeonin, :pbkdf2_rounds, 1

import_config "#{Mix.env}.exs"
