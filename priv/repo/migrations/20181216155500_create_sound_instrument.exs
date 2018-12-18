defmodule PhxApi.Repo.Migrations.CreateSoundInstrument do
  use Ecto.Migration

  def change do
    create table(:sound_instrument) do
      add :sound_id, :integer
      add :instrument_id, :integer
      add :is_enabled, :boolean, default: false, null: false

      timestamps()
    end

  end
end
