defmodule PhxApi.Sounds.Speed do
  use PhxApi.Schema
  import Ecto.Changeset


  schema "speed" do
    field :is_enabled, :boolean, default: false
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(speed, attrs) do
    speed
    |> cast(attrs, [:name, :is_enabled])
    |> validate_required([:name, :is_enabled])
  end
end
