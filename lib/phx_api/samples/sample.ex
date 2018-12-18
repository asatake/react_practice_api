defmodule PhxApi.Samples.Sample do
  use Ecto.Schema
  import Ecto.Changeset


  schema "sample" do
    field :body, :string
    field :is_enabled, :boolean, default: false
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(sample, attrs) do
    sample
    |> cast(attrs, [:title, :body, :is_enabled])
    |> validate_required([:title, :body, :is_enabled])
  end
end
