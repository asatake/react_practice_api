defmodule PhxApi.Repo.Migrations.CreateSpeed do
  use Ecto.Migration

  def change do
    create table(:speed) do
      add :name, :string
      add :is_enabled, :boolean, default: false, null: false

      timestamps()
    end

  end
end
