defmodule PhxApi.Repo.Migrations.CreateSoundSpeed do
  use Ecto.Migration

  def change do
    create table(:sound_speed) do
      add :sound_id, :integer
      add :speed_id, :integer
      add :is_enabled, :boolean, default: false, null: false

      timestamps()
    end

  end
end
