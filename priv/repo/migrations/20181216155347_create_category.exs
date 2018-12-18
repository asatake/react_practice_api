defmodule PhxApi.Repo.Migrations.CreateCategory do
  use Ecto.Migration

  def change do
    create table(:category) do
      add :name, :string
      add :is_enabled, :boolean, default: false, null: false

      timestamps()
    end

  end
end
