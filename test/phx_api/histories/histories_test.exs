defmodule PhxApi.HistoriesTest do
  use PhxApi.DataCase

  alias PhxApi.Histories

  describe "release_history" do
    alias PhxApi.Histories.ReleaseHistory

    @valid_attrs %{description: "some description"}
    @update_attrs %{description: "some updated description"}
    @invalid_attrs %{description: nil}

    def release_history_fixture(attrs \\ %{}) do
      {:ok, release_history} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Histories.create_release_history()

      release_history
    end

    test "list_release_history/0 returns all release_history" do
      release_history = release_history_fixture()
      assert Histories.list_release_history() == [release_history]
    end

    test "get_release_history!/1 returns the release_history with given id" do
      release_history = release_history_fixture()
      assert Histories.get_release_history!(release_history.id) == release_history
    end

    test "create_release_history/1 with valid data creates a release_history" do
      assert {:ok, %ReleaseHistory{} = release_history} = Histories.create_release_history(@valid_attrs)
      assert release_history.description == "some description"
    end

    test "create_release_history/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Histories.create_release_history(@invalid_attrs)
    end

    test "update_release_history/2 with valid data updates the release_history" do
      release_history = release_history_fixture()
      assert {:ok, %ReleaseHistory{} = release_history} = Histories.update_release_history(release_history, @update_attrs)
      assert release_history.description == "some updated description"
    end

    test "update_release_history/2 with invalid data returns error changeset" do
      release_history = release_history_fixture()
      assert {:error, %Ecto.Changeset{}} = Histories.update_release_history(release_history, @invalid_attrs)
      assert release_history == Histories.get_release_history!(release_history.id)
    end

    test "delete_release_history/1 deletes the release_history" do
      release_history = release_history_fixture()
      assert {:ok, %ReleaseHistory{}} = Histories.delete_release_history(release_history)
      assert_raise Ecto.NoResultsError, fn -> Histories.get_release_history!(release_history.id) end
    end

    test "change_release_history/1 returns a release_history changeset" do
      release_history = release_history_fixture()
      assert %Ecto.Changeset{} = Histories.change_release_history(release_history)
    end
  end
end
