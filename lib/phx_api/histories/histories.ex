defmodule PhxApi.Histories do
  @moduledoc """
  The Histories context.
  """

  import Ecto.Query, warn: false
  alias PhxApi.Repo

  alias PhxApi.Histories.ReleaseHistory

  @doc """
  Returns the list of release_history.

  ## Examples

      iex> list_release_history()
      [%ReleaseHistory{}, ...]

  """
  def list_release_history do
    Repo.all(ReleaseHistory)
  end

  @doc """
  Gets a single release_history.

  Raises `Ecto.NoResultsError` if the Release history does not exist.

  ## Examples

      iex> get_release_history!(123)
      %ReleaseHistory{}

      iex> get_release_history!(456)
      ** (Ecto.NoResultsError)

  """
  def get_release_history!(id), do: Repo.get!(ReleaseHistory, id)

  @doc """
  Creates a release_history.

  ## Examples

      iex> create_release_history(%{field: value})
      {:ok, %ReleaseHistory{}}

      iex> create_release_history(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_release_history(attrs \\ %{}) do
    %ReleaseHistory{}
    |> ReleaseHistory.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a release_history.

  ## Examples

      iex> update_release_history(release_history, %{field: new_value})
      {:ok, %ReleaseHistory{}}

      iex> update_release_history(release_history, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_release_history(%ReleaseHistory{} = release_history, attrs) do
    release_history
    |> ReleaseHistory.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a ReleaseHistory.

  ## Examples

      iex> delete_release_history(release_history)
      {:ok, %ReleaseHistory{}}

      iex> delete_release_history(release_history)
      {:error, %Ecto.Changeset{}}

  """
  def delete_release_history(%ReleaseHistory{} = release_history) do
    Repo.delete(release_history)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking release_history changes.

  ## Examples

      iex> change_release_history(release_history)
      %Ecto.Changeset{source: %ReleaseHistory{}}

  """
  def change_release_history(%ReleaseHistory{} = release_history) do
    ReleaseHistory.changeset(release_history, %{})
  end

  @doc """
  Get some release_history.

  Raises `Ecto.NoResultsError` if the Release history does not exist.

  ## Examples

  iex> get_release_history_some!(123)
  %ReleaseHistory{}

  iex> get_release_history_some!(0)
  ** (Ecto.NoResultsError)

  """
  def get_release_history_some!(num) do
    query = from r in ReleaseHistory,
      limit: ^num,
      order_by: [desc: r.updated_at]
    query |> Repo.all
  end

end
