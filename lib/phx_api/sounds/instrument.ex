defmodule PhxApi.Sounds.Instrument do
  use PhxApi.Schema
  import Ecto.Changeset


  schema "instrument" do
    field :is_enabled, :boolean, default: false
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(instrument, attrs) do
    instrument
    |> cast(attrs, [:name, :is_enabled])
    |> validate_required([:name, :is_enabled])
  end
end
