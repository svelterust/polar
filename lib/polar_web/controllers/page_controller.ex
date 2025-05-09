defmodule PolarWeb.PageController do
  use PolarWeb, :controller

  def index(conn, _params) do
    conn
    |> assign_prop(:items, inertia_defer(&fetch_items/0))
    |> render_inertia("Index")
  end

  defp fetch_items do
    Process.sleep(1000)
    ["Item 1", "Item 2", "Item 3"]
  end
end
