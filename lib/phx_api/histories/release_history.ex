defmodule PhxApi.Histories.ReleaseHistory do
  use PhxApi.Schema
  import Ecto.Changeset


  schema "release_history" do
    field :description, :string

    timestamps()
  end

  @doc false
  def changeset(release_history, attrs) do
    release_history
    |> cast(attrs, [:description])
    |> validate_required([:description])
  end
end
