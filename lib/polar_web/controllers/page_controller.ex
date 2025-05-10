defmodule PolarWeb.PageController do
  use PolarWeb, :controller

  def items(conn, _params) do
    conn
    |> assign_prop(:name, "James")
    |> assign_prop(:items, ["Item 1", "Item 2", "Item 3"])
    |> render_inertia("Home")
  end
end
