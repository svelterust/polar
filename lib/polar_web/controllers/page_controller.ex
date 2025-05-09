defmodule PolarWeb.PageController do
  use PolarWeb, :controller

  def index(conn, _params) do
    conn
    |> assign_prop(:items, inertia_defer(&fetch_items/0))
    |> render_inertia("Index")
  end

  defp fetch_items do
    Process.sleep(1000)
    Enum.map(1..Enum.random(5..10), fn i -> "Item #{i}" end)
  end
end
