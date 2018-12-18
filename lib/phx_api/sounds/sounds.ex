defmodule PhxApi.Sounds do
  @moduledoc """
  The Sounds context.
  """

  import Ecto.Query, warn: false
  alias PhxApi.Repo

  alias PhxApi.Sounds.Sound

  @doc """
  Returns the list of sound.

  ## Examples

      iex> list_sound()
      [%Sound{}, ...]

  """
  def list_sound do
    Repo.all(Sound)
  end

  @doc """
  Gets a single sound.

  Raises `Ecto.NoResultsError` if the Sound does not exist.

  ## Examples

      iex> get_sound!(123)
      %Sound{}

      iex> get_sound!(456)
      ** (Ecto.NoResultsError)

  """
  def get_sound!(id), do: Repo.get!(Sound, id)

  @doc """
  Creates a sound.

  ## Examples

      iex> create_sound(%{field: value})
      {:ok, %Sound{}}

      iex> create_sound(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_sound(attrs \\ %{}) do
    %Sound{}
    |> Sound.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a sound.

  ## Examples

      iex> update_sound(sound, %{field: new_value})
      {:ok, %Sound{}}

      iex> update_sound(sound, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_sound(%Sound{} = sound, attrs) do
    sound
    |> Sound.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Sound.

  ## Examples

      iex> delete_sound(sound)
      {:ok, %Sound{}}

      iex> delete_sound(sound)
      {:error, %Ecto.Changeset{}}

  """
  def delete_sound(%Sound{} = sound) do
    Repo.delete(sound)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking sound changes.

  ## Examples

      iex> change_sound(sound)
      %Ecto.Changeset{source: %Sound{}}

  """
  def change_sound(%Sound{} = sound) do
    Sound.changeset(sound, %{})
  end

  alias PhxApi.Sounds.Category

  @doc """
  Returns the list of category.

  ## Examples

      iex> list_category()
      [%Category{}, ...]

  """
  def list_category do
    Repo.all(Category)
  end

  @doc """
  Gets a single category.

  Raises `Ecto.NoResultsError` if the Category does not exist.

  ## Examples

      iex> get_category!(123)
      %Category{}

      iex> get_category!(456)
      ** (Ecto.NoResultsError)

  """
  def get_category!(id), do: Repo.get!(Category, id)

  @doc """
  Creates a category.

  ## Examples

      iex> create_category(%{field: value})
      {:ok, %Category{}}

      iex> create_category(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_category(attrs \\ %{}) do
    %Category{}
    |> Category.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a category.

  ## Examples

      iex> update_category(category, %{field: new_value})
      {:ok, %Category{}}

      iex> update_category(category, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_category(%Category{} = category, attrs) do
    category
    |> Category.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Category.

  ## Examples

      iex> delete_category(category)
      {:ok, %Category{}}

      iex> delete_category(category)
      {:error, %Ecto.Changeset{}}

  """
  def delete_category(%Category{} = category) do
    Repo.delete(category)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking category changes.

  ## Examples

      iex> change_category(category)
      %Ecto.Changeset{source: %Category{}}

  """
  def change_category(%Category{} = category) do
    Category.changeset(category, %{})
  end

  alias PhxApi.Sounds.Instrument

  @doc """
  Returns the list of instrument.

  ## Examples

      iex> list_instrument()
      [%Instrument{}, ...]

  """
  def list_instrument do
    Repo.all(Instrument)
  end

  @doc """
  Gets a single instrument.

  Raises `Ecto.NoResultsError` if the Instrument does not exist.

  ## Examples

      iex> get_instrument!(123)
      %Instrument{}

      iex> get_instrument!(456)
      ** (Ecto.NoResultsError)

  """
  def get_instrument!(id), do: Repo.get!(Instrument, id)

  @doc """
  Creates a instrument.

  ## Examples

      iex> create_instrument(%{field: value})
      {:ok, %Instrument{}}

      iex> create_instrument(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_instrument(attrs \\ %{}) do
    %Instrument{}
    |> Instrument.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a instrument.

  ## Examples

      iex> update_instrument(instrument, %{field: new_value})
      {:ok, %Instrument{}}

      iex> update_instrument(instrument, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_instrument(%Instrument{} = instrument, attrs) do
    instrument
    |> Instrument.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Instrument.

  ## Examples

      iex> delete_instrument(instrument)
      {:ok, %Instrument{}}

      iex> delete_instrument(instrument)
      {:error, %Ecto.Changeset{}}

  """
  def delete_instrument(%Instrument{} = instrument) do
    Repo.delete(instrument)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking instrument changes.

  ## Examples

      iex> change_instrument(instrument)
      %Ecto.Changeset{source: %Instrument{}}

  """
  def change_instrument(%Instrument{} = instrument) do
    Instrument.changeset(instrument, %{})
  end

  alias PhxApi.Sounds.Speed

  @doc """
  Returns the list of speed.

  ## Examples

      iex> list_speed()
      [%Speed{}, ...]

  """
  def list_speed do
    Repo.all(Speed)
  end

  @doc """
  Gets a single speed.

  Raises `Ecto.NoResultsError` if the Speed does not exist.

  ## Examples

      iex> get_speed!(123)
      %Speed{}

      iex> get_speed!(456)
      ** (Ecto.NoResultsError)

  """
  def get_speed!(id), do: Repo.get!(Speed, id)

  @doc """
  Creates a speed.

  ## Examples

      iex> create_speed(%{field: value})
      {:ok, %Speed{}}

      iex> create_speed(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_speed(attrs \\ %{}) do
    %Speed{}
    |> Speed.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a speed.

  ## Examples

      iex> update_speed(speed, %{field: new_value})
      {:ok, %Speed{}}

      iex> update_speed(speed, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_speed(%Speed{} = speed, attrs) do
    speed
    |> Speed.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Speed.

  ## Examples

      iex> delete_speed(speed)
      {:ok, %Speed{}}

      iex> delete_speed(speed)
      {:error, %Ecto.Changeset{}}

  """
  def delete_speed(%Speed{} = speed) do
    Repo.delete(speed)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking speed changes.

  ## Examples

      iex> change_speed(speed)
      %Ecto.Changeset{source: %Speed{}}

  """
  def change_speed(%Speed{} = speed) do
    Speed.changeset(speed, %{})
  end

  alias PhxApi.Sounds.SoundCategory

  @doc """
  Returns the list of sound_category.

  ## Examples

      iex> list_sound_category()
      [%SoundCategory{}, ...]

  """
  def list_sound_category do
    Repo.all(SoundCategory)
  end

  @doc """
  Gets a single sound_category.

  Raises `Ecto.NoResultsError` if the Sound category does not exist.

  ## Examples

      iex> get_sound_category!(123)
      %SoundCategory{}

      iex> get_sound_category!(456)
      ** (Ecto.NoResultsError)

  """
  def get_sound_category!(id), do: Repo.get!(SoundCategory, id)

  @doc """
  Creates a sound_category.

  ## Examples

      iex> create_sound_category(%{field: value})
      {:ok, %SoundCategory{}}

      iex> create_sound_category(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_sound_category(attrs \\ %{}) do
    %SoundCategory{}
    |> SoundCategory.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a sound_category.

  ## Examples

      iex> update_sound_category(sound_category, %{field: new_value})
      {:ok, %SoundCategory{}}

      iex> update_sound_category(sound_category, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_sound_category(%SoundCategory{} = sound_category, attrs) do
    sound_category
    |> SoundCategory.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a SoundCategory.

  ## Examples

      iex> delete_sound_category(sound_category)
      {:ok, %SoundCategory{}}

      iex> delete_sound_category(sound_category)
      {:error, %Ecto.Changeset{}}

  """
  def delete_sound_category(%SoundCategory{} = sound_category) do
    Repo.delete(sound_category)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking sound_category changes.

  ## Examples

      iex> change_sound_category(sound_category)
      %Ecto.Changeset{source: %SoundCategory{}}

  """
  def change_sound_category(%SoundCategory{} = sound_category) do
    SoundCategory.changeset(sound_category, %{})
  end

  alias PhxApi.Sounds.SoundInstrument

  @doc """
  Returns the list of sound_instrument.

  ## Examples

      iex> list_sound_instrument()
      [%SoundInstrument{}, ...]

  """
  def list_sound_instrument do
    Repo.all(SoundInstrument)
  end

  @doc """
  Gets a single sound_instrument.

  Raises `Ecto.NoResultsError` if the Sound instrument does not exist.

  ## Examples

      iex> get_sound_instrument!(123)
      %SoundInstrument{}

      iex> get_sound_instrument!(456)
      ** (Ecto.NoResultsError)

  """
  def get_sound_instrument!(id), do: Repo.get!(SoundInstrument, id)

  @doc """
  Creates a sound_instrument.

  ## Examples

      iex> create_sound_instrument(%{field: value})
      {:ok, %SoundInstrument{}}

      iex> create_sound_instrument(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_sound_instrument(attrs \\ %{}) do
    %SoundInstrument{}
    |> SoundInstrument.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a sound_instrument.

  ## Examples

      iex> update_sound_instrument(sound_instrument, %{field: new_value})
      {:ok, %SoundInstrument{}}

      iex> update_sound_instrument(sound_instrument, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_sound_instrument(%SoundInstrument{} = sound_instrument, attrs) do
    sound_instrument
    |> SoundInstrument.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a SoundInstrument.

  ## Examples

      iex> delete_sound_instrument(sound_instrument)
      {:ok, %SoundInstrument{}}

      iex> delete_sound_instrument(sound_instrument)
      {:error, %Ecto.Changeset{}}

  """
  def delete_sound_instrument(%SoundInstrument{} = sound_instrument) do
    Repo.delete(sound_instrument)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking sound_instrument changes.

  ## Examples

      iex> change_sound_instrument(sound_instrument)
      %Ecto.Changeset{source: %SoundInstrument{}}

  """
  def change_sound_instrument(%SoundInstrument{} = sound_instrument) do
    SoundInstrument.changeset(sound_instrument, %{})
  end

  alias PhxApi.Sounds.SoundSpeed

  @doc """
  Returns the list of sound_speed.

  ## Examples

      iex> list_sound_speed()
      [%SoundSpeed{}, ...]

  """
  def list_sound_speed do
    Repo.all(SoundSpeed)
  end

  @doc """
  Gets a single sound_speed.

  Raises `Ecto.NoResultsError` if the Sound speed does not exist.

  ## Examples

      iex> get_sound_speed!(123)
      %SoundSpeed{}

      iex> get_sound_speed!(456)
      ** (Ecto.NoResultsError)

  """
  def get_sound_speed!(id), do: Repo.get!(SoundSpeed, id)

  @doc """
  Creates a sound_speed.

  ## Examples

      iex> create_sound_speed(%{field: value})
      {:ok, %SoundSpeed{}}

      iex> create_sound_speed(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_sound_speed(attrs \\ %{}) do
    %SoundSpeed{}
    |> SoundSpeed.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a sound_speed.

  ## Examples

      iex> update_sound_speed(sound_speed, %{field: new_value})
      {:ok, %SoundSpeed{}}

      iex> update_sound_speed(sound_speed, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_sound_speed(%SoundSpeed{} = sound_speed, attrs) do
    sound_speed
    |> SoundSpeed.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a SoundSpeed.

  ## Examples

      iex> delete_sound_speed(sound_speed)
      {:ok, %SoundSpeed{}}

      iex> delete_sound_speed(sound_speed)
      {:error, %Ecto.Changeset{}}

  """
  def delete_sound_speed(%SoundSpeed{} = sound_speed) do
    Repo.delete(sound_speed)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking sound_speed changes.

  ## Examples

      iex> change_sound_speed(sound_speed)
      %Ecto.Changeset{source: %SoundSpeed{}}

  """
  def change_sound_speed(%SoundSpeed{} = sound_speed) do
    SoundSpeed.changeset(sound_speed, %{})
  end

  # custom queries

  @doc """
  Returns the list of ENABLED sound.

  ## Examples

  iex> list_enabled_sound()
  [%Sound{}, ...]

  """
  def list_enabled_sound do
    # fetch sounds
    query = from s in Sound,
      where: s.is_enabled == true,
      select: s
    query |> Repo.all
    # sounds = query |> Repo.all
    # sound_ids = sounds
    # |> Enum.map(fn(x) -> x.id end)

    # categories_query = from s in SoundCategory,
    #   where: s.id in sound_ids
    # instruments_query = from s in SoundInstrument,
    #   where: s.id in sound_ids
    # speeds_query = from s in SoundSpeed,
    #   where: s.id in sound_ids

    # categories = categories_query |> Repo.all
    # instruments = instruments_query |> Repo.all
    # speeds = speeds_query |> Repo.all

    # category = categories
    # |> Enum.group_by(fn(x) -> x.sound_id end)
    # |> Enum.map(fn{x, y} -> %{id: x, title: Enum.map(y, fn(z) -> z.category_id end)} end)

    # instrument = instruments
    # |> Enum.group_by(fn(x) -> x.sound_id end)
    # |> Enum.map(fn{x, y} -> %{id: x, title: Enum.map(y, fn(z) -> z.instrument_id end)} end)

    # speed = speeds
    # |> Enum.group_by(fn(x) -> x.sound_id end)
    # |> Enum.map(fn{x, y} -> %{id: x, title: Enum.map(y, fn(z) -> z.speed_id end)} end)

  end

end
