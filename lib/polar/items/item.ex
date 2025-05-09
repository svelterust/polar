defmodule Polar.Items.Item do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder, only: [:title, :description, :inserted_at]}

  schema "items" do
    field :title, :string
    field :description, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(item, attrs) do
    item
    |> cast(attrs, [:title, :description])
    |> validate_required([:title])
    |> validate_length(:title, min: 1, max: 100)
    |> validate_length(:description, max: 255)
  end
end
