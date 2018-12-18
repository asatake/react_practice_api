defmodule PhxApi.Sounds.Category do
  use PhxApi.Schema
  import Ecto.Changeset


  schema "category" do
    field :is_enabled, :boolean, default: false
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(category, attrs) do
    category
    |> cast(attrs, [:name, :is_enabled])
    |> validate_required([:name, :is_enabled])
  end
end
