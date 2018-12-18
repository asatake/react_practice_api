defmodule PhxApi.SoundsTest do
  use PhxApi.DataCase

  alias PhxApi.Sounds

  describe "sound" do
    alias PhxApi.Sounds.Sound

    @valid_attrs %{description: "some description", higher_bpm: 42, is_effect: true, is_enabled: true, kana: "some kana", lower_bpm: 42, title: "some title", url: "some url"}
    @update_attrs %{description: "some updated description", higher_bpm: 43, is_effect: false, is_enabled: false, kana: "some updated kana", lower_bpm: 43, title: "some updated title", url: "some updated url"}
    @invalid_attrs %{description: nil, higher_bpm: nil, is_effect: nil, is_enabled: nil, kana: nil, lower_bpm: nil, title: nil, url: nil}

    def sound_fixture(attrs \\ %{}) do
      {:ok, sound} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Sounds.create_sound()

      sound
    end

    test "list_sound/0 returns all sound" do
      sound = sound_fixture()
      assert Sounds.list_sound() == [sound]
    end

    test "get_sound!/1 returns the sound with given id" do
      sound = sound_fixture()
      assert Sounds.get_sound!(sound.id) == sound
    end

    test "create_sound/1 with valid data creates a sound" do
      assert {:ok, %Sound{} = sound} = Sounds.create_sound(@valid_attrs)
      assert sound.description == "some description"
      assert sound.higher_bpm == 42
      assert sound.is_effect == true
      assert sound.is_enabled == true
      assert sound.kana == "some kana"
      assert sound.lower_bpm == 42
      assert sound.title == "some title"
      assert sound.url == "some url"
    end

    test "create_sound/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sounds.create_sound(@invalid_attrs)
    end

    test "update_sound/2 with valid data updates the sound" do
      sound = sound_fixture()
      assert {:ok, %Sound{} = sound} = Sounds.update_sound(sound, @update_attrs)
      assert sound.description == "some updated description"
      assert sound.higher_bpm == 43
      assert sound.is_effect == false
      assert sound.is_enabled == false
      assert sound.kana == "some updated kana"
      assert sound.lower_bpm == 43
      assert sound.title == "some updated title"
      assert sound.url == "some updated url"
    end

    test "update_sound/2 with invalid data returns error changeset" do
      sound = sound_fixture()
      assert {:error, %Ecto.Changeset{}} = Sounds.update_sound(sound, @invalid_attrs)
      assert sound == Sounds.get_sound!(sound.id)
    end

    test "delete_sound/1 deletes the sound" do
      sound = sound_fixture()
      assert {:ok, %Sound{}} = Sounds.delete_sound(sound)
      assert_raise Ecto.NoResultsError, fn -> Sounds.get_sound!(sound.id) end
    end

    test "change_sound/1 returns a sound changeset" do
      sound = sound_fixture()
      assert %Ecto.Changeset{} = Sounds.change_sound(sound)
    end
  end

  describe "category" do
    alias PhxApi.Sounds.Category

    @valid_attrs %{is_enabled: true, name: "some name"}
    @update_attrs %{is_enabled: false, name: "some updated name"}
    @invalid_attrs %{is_enabled: nil, name: nil}

    def category_fixture(attrs \\ %{}) do
      {:ok, category} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Sounds.create_category()

      category
    end

    test "list_category/0 returns all category" do
      category = category_fixture()
      assert Sounds.list_category() == [category]
    end

    test "get_category!/1 returns the category with given id" do
      category = category_fixture()
      assert Sounds.get_category!(category.id) == category
    end

    test "create_category/1 with valid data creates a category" do
      assert {:ok, %Category{} = category} = Sounds.create_category(@valid_attrs)
      assert category.is_enabled == true
      assert category.name == "some name"
    end

    test "create_category/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sounds.create_category(@invalid_attrs)
    end

    test "update_category/2 with valid data updates the category" do
      category = category_fixture()
      assert {:ok, %Category{} = category} = Sounds.update_category(category, @update_attrs)
      assert category.is_enabled == false
      assert category.name == "some updated name"
    end

    test "update_category/2 with invalid data returns error changeset" do
      category = category_fixture()
      assert {:error, %Ecto.Changeset{}} = Sounds.update_category(category, @invalid_attrs)
      assert category == Sounds.get_category!(category.id)
    end

    test "delete_category/1 deletes the category" do
      category = category_fixture()
      assert {:ok, %Category{}} = Sounds.delete_category(category)
      assert_raise Ecto.NoResultsError, fn -> Sounds.get_category!(category.id) end
    end

    test "change_category/1 returns a category changeset" do
      category = category_fixture()
      assert %Ecto.Changeset{} = Sounds.change_category(category)
    end
  end

  describe "instrument" do
    alias PhxApi.Sounds.Instrument

    @valid_attrs %{is_enabled: true, name: "some name"}
    @update_attrs %{is_enabled: false, name: "some updated name"}
    @invalid_attrs %{is_enabled: nil, name: nil}

    def instrument_fixture(attrs \\ %{}) do
      {:ok, instrument} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Sounds.create_instrument()

      instrument
    end

    test "list_instrument/0 returns all instrument" do
      instrument = instrument_fixture()
      assert Sounds.list_instrument() == [instrument]
    end

    test "get_instrument!/1 returns the instrument with given id" do
      instrument = instrument_fixture()
      assert Sounds.get_instrument!(instrument.id) == instrument
    end

    test "create_instrument/1 with valid data creates a instrument" do
      assert {:ok, %Instrument{} = instrument} = Sounds.create_instrument(@valid_attrs)
      assert instrument.is_enabled == true
      assert instrument.name == "some name"
    end

    test "create_instrument/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sounds.create_instrument(@invalid_attrs)
    end

    test "update_instrument/2 with valid data updates the instrument" do
      instrument = instrument_fixture()
      assert {:ok, %Instrument{} = instrument} = Sounds.update_instrument(instrument, @update_attrs)
      assert instrument.is_enabled == false
      assert instrument.name == "some updated name"
    end

    test "update_instrument/2 with invalid data returns error changeset" do
      instrument = instrument_fixture()
      assert {:error, %Ecto.Changeset{}} = Sounds.update_instrument(instrument, @invalid_attrs)
      assert instrument == Sounds.get_instrument!(instrument.id)
    end

    test "delete_instrument/1 deletes the instrument" do
      instrument = instrument_fixture()
      assert {:ok, %Instrument{}} = Sounds.delete_instrument(instrument)
      assert_raise Ecto.NoResultsError, fn -> Sounds.get_instrument!(instrument.id) end
    end

    test "change_instrument/1 returns a instrument changeset" do
      instrument = instrument_fixture()
      assert %Ecto.Changeset{} = Sounds.change_instrument(instrument)
    end
  end

  describe "speed" do
    alias PhxApi.Sounds.Speed

    @valid_attrs %{is_enabled: true, name: "some name"}
    @update_attrs %{is_enabled: false, name: "some updated name"}
    @invalid_attrs %{is_enabled: nil, name: nil}

    def speed_fixture(attrs \\ %{}) do
      {:ok, speed} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Sounds.create_speed()

      speed
    end

    test "list_speed/0 returns all speed" do
      speed = speed_fixture()
      assert Sounds.list_speed() == [speed]
    end

    test "get_speed!/1 returns the speed with given id" do
      speed = speed_fixture()
      assert Sounds.get_speed!(speed.id) == speed
    end

    test "create_speed/1 with valid data creates a speed" do
      assert {:ok, %Speed{} = speed} = Sounds.create_speed(@valid_attrs)
      assert speed.is_enabled == true
      assert speed.name == "some name"
    end

    test "create_speed/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sounds.create_speed(@invalid_attrs)
    end

    test "update_speed/2 with valid data updates the speed" do
      speed = speed_fixture()
      assert {:ok, %Speed{} = speed} = Sounds.update_speed(speed, @update_attrs)
      assert speed.is_enabled == false
      assert speed.name == "some updated name"
    end

    test "update_speed/2 with invalid data returns error changeset" do
      speed = speed_fixture()
      assert {:error, %Ecto.Changeset{}} = Sounds.update_speed(speed, @invalid_attrs)
      assert speed == Sounds.get_speed!(speed.id)
    end

    test "delete_speed/1 deletes the speed" do
      speed = speed_fixture()
      assert {:ok, %Speed{}} = Sounds.delete_speed(speed)
      assert_raise Ecto.NoResultsError, fn -> Sounds.get_speed!(speed.id) end
    end

    test "change_speed/1 returns a speed changeset" do
      speed = speed_fixture()
      assert %Ecto.Changeset{} = Sounds.change_speed(speed)
    end
  end

  describe "sound_category" do
    alias PhxApi.Sounds.SoundCategory

    @valid_attrs %{category_id: 42, is_enabled: true, sound_id: 42}
    @update_attrs %{category_id: 43, is_enabled: false, sound_id: 43}
    @invalid_attrs %{category_id: nil, is_enabled: nil, sound_id: nil}

    def sound_category_fixture(attrs \\ %{}) do
      {:ok, sound_category} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Sounds.create_sound_category()

      sound_category
    end

    test "list_sound_category/0 returns all sound_category" do
      sound_category = sound_category_fixture()
      assert Sounds.list_sound_category() == [sound_category]
    end

    test "get_sound_category!/1 returns the sound_category with given id" do
      sound_category = sound_category_fixture()
      assert Sounds.get_sound_category!(sound_category.id) == sound_category
    end

    test "create_sound_category/1 with valid data creates a sound_category" do
      assert {:ok, %SoundCategory{} = sound_category} = Sounds.create_sound_category(@valid_attrs)
      assert sound_category.category_id == 42
      assert sound_category.is_enabled == true
      assert sound_category.sound_id == 42
    end

    test "create_sound_category/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sounds.create_sound_category(@invalid_attrs)
    end

    test "update_sound_category/2 with valid data updates the sound_category" do
      sound_category = sound_category_fixture()
      assert {:ok, %SoundCategory{} = sound_category} = Sounds.update_sound_category(sound_category, @update_attrs)
      assert sound_category.category_id == 43
      assert sound_category.is_enabled == false
      assert sound_category.sound_id == 43
    end

    test "update_sound_category/2 with invalid data returns error changeset" do
      sound_category = sound_category_fixture()
      assert {:error, %Ecto.Changeset{}} = Sounds.update_sound_category(sound_category, @invalid_attrs)
      assert sound_category == Sounds.get_sound_category!(sound_category.id)
    end

    test "delete_sound_category/1 deletes the sound_category" do
      sound_category = sound_category_fixture()
      assert {:ok, %SoundCategory{}} = Sounds.delete_sound_category(sound_category)
      assert_raise Ecto.NoResultsError, fn -> Sounds.get_sound_category!(sound_category.id) end
    end

    test "change_sound_category/1 returns a sound_category changeset" do
      sound_category = sound_category_fixture()
      assert %Ecto.Changeset{} = Sounds.change_sound_category(sound_category)
    end
  end

  describe "sound_instrument" do
    alias PhxApi.Sounds.SoundInstrument

    @valid_attrs %{instrument_id: 42, is_enabled: true, sound_id: 42}
    @update_attrs %{instrument_id: 43, is_enabled: false, sound_id: 43}
    @invalid_attrs %{instrument_id: nil, is_enabled: nil, sound_id: nil}

    def sound_instrument_fixture(attrs \\ %{}) do
      {:ok, sound_instrument} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Sounds.create_sound_instrument()

      sound_instrument
    end

    test "list_sound_instrument/0 returns all sound_instrument" do
      sound_instrument = sound_instrument_fixture()
      assert Sounds.list_sound_instrument() == [sound_instrument]
    end

    test "get_sound_instrument!/1 returns the sound_instrument with given id" do
      sound_instrument = sound_instrument_fixture()
      assert Sounds.get_sound_instrument!(sound_instrument.id) == sound_instrument
    end

    test "create_sound_instrument/1 with valid data creates a sound_instrument" do
      assert {:ok, %SoundInstrument{} = sound_instrument} = Sounds.create_sound_instrument(@valid_attrs)
      assert sound_instrument.instrument_id == 42
      assert sound_instrument.is_enabled == true
      assert sound_instrument.sound_id == 42
    end

    test "create_sound_instrument/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sounds.create_sound_instrument(@invalid_attrs)
    end

    test "update_sound_instrument/2 with valid data updates the sound_instrument" do
      sound_instrument = sound_instrument_fixture()
      assert {:ok, %SoundInstrument{} = sound_instrument} = Sounds.update_sound_instrument(sound_instrument, @update_attrs)
      assert sound_instrument.instrument_id == 43
      assert sound_instrument.is_enabled == false
      assert sound_instrument.sound_id == 43
    end

    test "update_sound_instrument/2 with invalid data returns error changeset" do
      sound_instrument = sound_instrument_fixture()
      assert {:error, %Ecto.Changeset{}} = Sounds.update_sound_instrument(sound_instrument, @invalid_attrs)
      assert sound_instrument == Sounds.get_sound_instrument!(sound_instrument.id)
    end

    test "delete_sound_instrument/1 deletes the sound_instrument" do
      sound_instrument = sound_instrument_fixture()
      assert {:ok, %SoundInstrument{}} = Sounds.delete_sound_instrument(sound_instrument)
      assert_raise Ecto.NoResultsError, fn -> Sounds.get_sound_instrument!(sound_instrument.id) end
    end

    test "change_sound_instrument/1 returns a sound_instrument changeset" do
      sound_instrument = sound_instrument_fixture()
      assert %Ecto.Changeset{} = Sounds.change_sound_instrument(sound_instrument)
    end
  end

  describe "sound_speed" do
    alias PhxApi.Sounds.SoundSpeed

    @valid_attrs %{is_enabled: true, sound_id: 42, speed_id: 42}
    @update_attrs %{is_enabled: false, sound_id: 43, speed_id: 43}
    @invalid_attrs %{is_enabled: nil, sound_id: nil, speed_id: nil}

    def sound_speed_fixture(attrs \\ %{}) do
      {:ok, sound_speed} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Sounds.create_sound_speed()

      sound_speed
    end

    test "list_sound_speed/0 returns all sound_speed" do
      sound_speed = sound_speed_fixture()
      assert Sounds.list_sound_speed() == [sound_speed]
    end

    test "get_sound_speed!/1 returns the sound_speed with given id" do
      sound_speed = sound_speed_fixture()
      assert Sounds.get_sound_speed!(sound_speed.id) == sound_speed
    end

    test "create_sound_speed/1 with valid data creates a sound_speed" do
      assert {:ok, %SoundSpeed{} = sound_speed} = Sounds.create_sound_speed(@valid_attrs)
      assert sound_speed.is_enabled == true
      assert sound_speed.sound_id == 42
      assert sound_speed.speed_id == 42
    end

    test "create_sound_speed/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sounds.create_sound_speed(@invalid_attrs)
    end

    test "update_sound_speed/2 with valid data updates the sound_speed" do
      sound_speed = sound_speed_fixture()
      assert {:ok, %SoundSpeed{} = sound_speed} = Sounds.update_sound_speed(sound_speed, @update_attrs)
      assert sound_speed.is_enabled == false
      assert sound_speed.sound_id == 43
      assert sound_speed.speed_id == 43
    end

    test "update_sound_speed/2 with invalid data returns error changeset" do
      sound_speed = sound_speed_fixture()
      assert {:error, %Ecto.Changeset{}} = Sounds.update_sound_speed(sound_speed, @invalid_attrs)
      assert sound_speed == Sounds.get_sound_speed!(sound_speed.id)
    end

    test "delete_sound_speed/1 deletes the sound_speed" do
      sound_speed = sound_speed_fixture()
      assert {:ok, %SoundSpeed{}} = Sounds.delete_sound_speed(sound_speed)
      assert_raise Ecto.NoResultsError, fn -> Sounds.get_sound_speed!(sound_speed.id) end
    end

    test "change_sound_speed/1 returns a sound_speed changeset" do
      sound_speed = sound_speed_fixture()
      assert %Ecto.Changeset{} = Sounds.change_sound_speed(sound_speed)
    end
  end
end
