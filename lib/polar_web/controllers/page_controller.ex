defmodule PolarWeb.PageController do
  use PolarWeb, :controller

  def index(conn, _params) do
    render_inertia(conn, "Index")
  end
end
