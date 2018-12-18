defmodule PhxApi.Repo.Migrations.CreateSample do
  use Ecto.Migration

  def change do
    create table(:sample) do
      add :title, :string
      add :body, :string
      add :is_enabled, :boolean, default: false, null: false

      timestamps()
    end

  end
end
