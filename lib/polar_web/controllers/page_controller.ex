defmodule PolarWeb.PageController do
  use PolarWeb, :controller
  alias Polar.Items

  def items(conn, _params) do
    conn
    |> assign_prop(:items, Items.list_items())
    |> render_inertia("Items")
  end

  def create_item(conn, params) do
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

  def delete_item(conn, %{"id" => id}) do
    item = Items.get_item!(id)

    case Items.delete_item(item) do
      {:ok, _item} ->
        conn
        |> put_flash(:info, "Item deleted successfully.")
        |> redirect(to: ~p"/")

      {:error, _changeset} ->
        conn
        |> put_flash(:error, "Item could not be deleted.")
        |> redirect(to: ~p"/")
    end
  end
end
