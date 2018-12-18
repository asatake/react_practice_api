defmodule PhxApi.Repo.Migrations.CreateReleaseHistory do
  use Ecto.Migration

  def change do
    create table(:release_history) do
      add :description, :string

      timestamps()
    end

  end
end
