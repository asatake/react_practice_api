defmodule PhxApi.Repo.Migrations.CreateSoundCategory do
  use Ecto.Migration

  def change do
    create table(:sound_category) do
      add :sound_id, :integer
      add :category_id, :integer
      add :is_enabled, :boolean, default: false, null: false

      timestamps()
    end

  end
end
