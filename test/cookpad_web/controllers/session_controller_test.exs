defmodule CookpadWeb.SessionControllerTest do
  use CookpadWeb.ConnCase

  describe "create/2" do
    test "Creates, and redirect to :index if attributes are valid", %{conn: conn} do
      conn = post(conn, "/sessions", %{"user" => %{"name" => "test_user", "password" => "test"}})

      assert get_session(conn, :current_user) == "test_user"
      assert redirected_to(conn, 302) =~ "/"
    end

    test "Returns an error and does not create a user if attributes are invalid", %{conn: conn} do
      conn = post(conn, "/sessions", %{"user" => %{"name" => "", "password" => ""}})

      assert get_session(conn, :current_user) == nil
      assert html_response(conn, 200) =~ "can not be blank"
    end
  end

  describe "show/2" do
    test "Responds with user info if the user is found" do
      conn = Plug.Test.init_test_session(build_conn(), current_user: "test")
      conn = get(conn, "/sessions")
      assert html_response(conn, 200) =~ "You are logged in"
    end

    test "Responds with a message indicating user not logged in", %{conn: conn} do
      conn = get(conn, "/sessions")
      assert html_response(conn, 200) =~ "You are not logged"
    end
  end

  test "delete/2 and redirect to :index", %{conn: _conn} do
    conn = Plug.Test.init_test_session(build_conn(), current_user: "test")
    conn = delete(conn, "/sessions")

    assert get_session(conn, :current_user) == nil
    assert redirected_to(conn, 302) =~ "/"
  end
end
