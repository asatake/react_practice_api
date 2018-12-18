defmodule PhxApi.SamplesTest do
  use PhxApi.DataCase

  alias PhxApi.Samples

  describe "sample" do
    alias PhxApi.Samples.Sample

    @valid_attrs %{body: "some body", is_enabled: true, title: "some title"}
    @update_attrs %{body: "some updated body", is_enabled: false, title: "some updated title"}
    @invalid_attrs %{body: nil, is_enabled: nil, title: nil}

    def sample_fixture(attrs \\ %{}) do
      {:ok, sample} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Samples.create_sample()

      sample
    end

    test "list_sample/0 returns all sample" do
      sample = sample_fixture()
      assert Samples.list_sample() == [sample]
    end

    test "get_sample!/1 returns the sample with given id" do
      sample = sample_fixture()
      assert Samples.get_sample!(sample.id) == sample
    end

    test "create_sample/1 with valid data creates a sample" do
      assert {:ok, %Sample{} = sample} = Samples.create_sample(@valid_attrs)
      assert sample.body == "some body"
      assert sample.is_enabled == true
      assert sample.title == "some title"
    end

    test "create_sample/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Samples.create_sample(@invalid_attrs)
    end

    test "update_sample/2 with valid data updates the sample" do
      sample = sample_fixture()
      assert {:ok, %Sample{} = sample} = Samples.update_sample(sample, @update_attrs)
      assert sample.body == "some updated body"
      assert sample.is_enabled == false
      assert sample.title == "some updated title"
    end

    test "update_sample/2 with invalid data returns error changeset" do
      sample = sample_fixture()
      assert {:error, %Ecto.Changeset{}} = Samples.update_sample(sample, @invalid_attrs)
      assert sample == Samples.get_sample!(sample.id)
    end

    test "delete_sample/1 deletes the sample" do
      sample = sample_fixture()
      assert {:ok, %Sample{}} = Samples.delete_sample(sample)
      assert_raise Ecto.NoResultsError, fn -> Samples.get_sample!(sample.id) end
    end

    test "change_sample/1 returns a sample changeset" do
      sample = sample_fixture()
      assert %Ecto.Changeset{} = Samples.change_sample(sample)
    end
  end
end
