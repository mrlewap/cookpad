defmodule CookpadWeb.PageController do
  use CookpadWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
