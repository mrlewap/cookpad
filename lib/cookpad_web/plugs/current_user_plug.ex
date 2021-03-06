defmodule CookpadWeb.CurrentUserPlug do
  import Plug.Conn, only: [get_session: 2, assign: 3]

  @moduledoc "Add @current_user to assigns"

  def init(opts), do: opts

  def call(conn, _opts) do
    conn
    |> assign(:current_user, get_session(conn, :current_user))
  end
end
