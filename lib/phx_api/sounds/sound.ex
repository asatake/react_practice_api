defmodule PhxApi.Sounds.Sound do
  use PhxApi.Schema
  import Ecto.Changeset


  schema "sound" do
    field :description, :string
    field :higher_bpm, :integer
    field :is_effect, :boolean, default: false
    field :is_enabled, :boolean, default: false
    field :kana, :string
    field :lower_bpm, :integer
    field :title, :string
    field :url, :string

    timestamps()
  end

  @doc false
  def changeset(sound, attrs) do
    sound
    |> cast(attrs, [:title, :kana, :url, :lower_bpm, :higher_bpm, :description, :is_effect, :is_enabled])
    |> validate_required([:title, :kana, :url, :lower_bpm, :higher_bpm, :description, :is_effect, :is_enabled])
  end
end
