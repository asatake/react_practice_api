defmodule PhxApi.Repo.Migrations.CreateSound do
  use Ecto.Migration

  def change do
    create table(:sound) do
      add :title, :string
      add :kana, :string
      add :url, :string
      add :lower_bpm, :integer
      add :higher_bpm, :integer
      add :description, :string
      add :is_effect, :boolean, default: false, null: false
      add :is_enabled, :boolean, default: false, null: false

      timestamps()
    end

  end
end
