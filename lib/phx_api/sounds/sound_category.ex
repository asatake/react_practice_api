defmodule PhxApi.Sounds.SoundCategory do
  use PhxApi.Schema
  import Ecto.Changeset


  schema "sound_category" do
    field :category_id, :integer
    field :is_enabled, :boolean, default: false
    field :sound_id, :integer

    timestamps()
  end

  @doc false
  def changeset(sound_category, attrs) do
    sound_category
    |> cast(attrs, [:sound_id, :category_id, :is_enabled])
    |> validate_required([:sound_id, :category_id, :is_enabled])
  end
end
