use Mix.Config

# Configure your database
config :cookpad, Cookpad.Repo,
  username: "postgres",
  password: "postgres",
  database: "cookpad_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# Configure the database for GitHub Actions
if System.get_env("GITHUB_ACTIONS") do
  config :app, Cookpad.Repo,
         username: "postgres",
         password: "postgres"
end

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :cookpad, CookpadWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
