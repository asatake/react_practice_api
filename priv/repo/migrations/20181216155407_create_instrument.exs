defmodule PhxApi.Repo.Migrations.CreateInstrument do
  use Ecto.Migration

  def change do
    create table(:instrument) do
      add :name, :string
      add :is_enabled, :boolean, default: false, null: false

      timestamps()
    end

  end
end
