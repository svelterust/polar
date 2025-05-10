defmodule PolarWeb.PageController do
  use PolarWeb, :controller

  def login_page(conn, _params) do
    conn
    |> assign_prop(:name, "James")
    |> render_inertia("Login")
  end

  def login(conn, params) do
    IO.inspect(params)
    redirect(conn, to: ~p"/")
  end
end
