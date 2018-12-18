defmodule PhxApi.Sounds.SoundInstrument do
  use PhxApi.Schema
  import Ecto.Changeset


  schema "sound_instrument" do
    field :instrument_id, :integer
    field :is_enabled, :boolean, default: false
    field :sound_id, :integer

    timestamps()
  end

  @doc false
  def changeset(sound_instrument, attrs) do
    sound_instrument
    |> cast(attrs, [:sound_id, :instrument_id, :is_enabled])
    |> validate_required([:sound_id, :instrument_id, :is_enabled])
  end
end
