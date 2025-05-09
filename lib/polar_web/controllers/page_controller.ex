defmodule PolarWeb.PageController do
  use PolarWeb, :controller

  def index(conn, _params) do
    conn
    |> assign_prop(:items, ["Item 1", "Item 2", "Item 3"])
    |> render_inertia("Index")
  end

  def cars(conn, _params) do
    conn
    |> render_inertia("Cars")
  end
end
