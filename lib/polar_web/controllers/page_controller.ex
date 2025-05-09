defmodule PolarWeb.PageController do
  use PolarWeb, :controller
  alias Polar.Items

  def items_page(conn, _params) do
    conn
    |> assign_prop(:items, Items.list_items())
    |> render_inertia("Items")
  end

  def items(conn, params) do
    case Items.create_item(params) do
      {:ok, _item} ->
        conn
        |> put_flash(:info, "Item created successfully.")
        |> redirect(to: ~p"/")

      {:error, changeset} ->
        conn
        |> assign_errors(changeset)
        |> redirect(to: ~p"/")
    end
  end
end
