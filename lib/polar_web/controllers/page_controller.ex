defmodule PolarWeb.PageController do
  use PolarWeb, :controller
  alias Polar.Items

  def index(conn, _params) do
    conn
    |> assign_prop(:items, Items.list_items())
    |> render_inertia("Index")
  end
end
