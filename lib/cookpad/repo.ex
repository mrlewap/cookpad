defmodule Cookpad.Repo do
  use Ecto.Repo,
    otp_app: :cookpad,
    adapter: Ecto.Adapters.Postgres
end
