defmodule CookpadWeb.Router do
  use CookpadWeb, :router
  use Plug.ErrorHandler

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug CookpadWeb.CurrentUserPlug
  end

  pipeline :protected do
    plug CookpadWeb.AuthPlug
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", CookpadWeb do
    pipe_through :browser

    get "/", PageController, :index
    resources "/sessions", SessionController, singleton: true
  end

  scope "/", CookpadWeb do
    pipe_through [:browser, :protected]

    get "/terms", PageController, :terms
  end

  def handle_errors(conn, %{kind: :error, reason: %Phoenix.Router.NoRouteError{}, stack: _stack}) do
    conn
    |> fetch_session()
    |> fetch_flash()
    |> put_layout({CookpadWeb.LayoutView, :app})
    |> put_view(CookpadWeb.ErrorView)
    |> render("404.html")
  end

  def handle_errors(conn, %{kind: :error, reason: %Phoenix.ActionClauseError{}, stack: _stack}) do
    conn
    |> fetch_session()
    |> fetch_flash()
    |> put_layout({CookpadWeb.LayoutView, :app})
    |> put_view(CookpadWeb.ErrorView)
    |> render("500.html")
  end

  use Honeybadger.Plug

  # Other scopes may use custom stacks.
  # scope "/api", CookpadWeb do
  #   pipe_through :api
  # end
end
