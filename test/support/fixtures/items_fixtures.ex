defmodule Polar.ItemsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Polar.Items` context.
  """

  @doc """
  Generate a item.
  """
  def item_fixture(attrs \\ %{}) do
    {:ok, item} =
      attrs
      |> Enum.into(%{
        description: "some description",
        title: "some title"
      })
      |> Polar.Items.create_item()

    item
  end
end
