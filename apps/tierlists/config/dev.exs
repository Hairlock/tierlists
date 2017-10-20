use Mix.Config

# Configure your database
config :tierlists, Tierlists.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "password",
  database: "tierlists_dev",
  hostname: "localhost",
  pool_size: 10
