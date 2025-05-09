defmodule Polar.Repo.Migrations.CreateItems do
  use Ecto.Migration

  def change do
    create table(:items) do
      add :title, :string
      add :description, :text

      timestamps(type: :utc_datetime)
    end
  end
end
