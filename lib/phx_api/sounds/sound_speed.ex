defmodule PhxApi.Sounds.SoundSpeed do
  use PhxApi.Schema
  import Ecto.Changeset


  schema "sound_speed" do
    field :is_enabled, :boolean, default: false
    field :sound_id, :integer
    field :speed_id, :integer

    timestamps()
  end

  @doc false
  def changeset(sound_speed, attrs) do
    sound_speed
    |> cast(attrs, [:sound_id, :speed_id, :is_enabled])
    |> validate_required([:sound_id, :speed_id, :is_enabled])
  end
end
