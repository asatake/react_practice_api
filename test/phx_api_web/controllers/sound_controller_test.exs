defmodule PhxApiWeb.SoundControllerTest do
  use PhxApiWeb.ConnCase

  alias PhxApi.Sounds
  alias PhxApi.Sounds.Sound

  @create_attrs %{
    description: "some description",
    higher_bpm: 42,
    is_effect: true,
    is_enabled: true,
    kana: "some kana",
    lower_bpm: 42,
    title: "some title",
    url: "some url"
  }
  @update_attrs %{
    description: "some updated description",
    higher_bpm: 43,
    is_effect: false,
    is_enabled: false,
    kana: "some updated kana",
    lower_bpm: 43,
    title: "some updated title",
    url: "some updated url"
  }
  @invalid_attrs %{description: nil, higher_bpm: nil, is_effect: nil, is_enabled: nil, kana: nil, lower_bpm: nil, title: nil, url: nil}

  def fixture(:sound) do
    {:ok, sound} = Sounds.create_sound(@create_attrs)
    sound
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all sound", %{conn: conn} do
      conn = get(conn, Routes.sound_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create sound" do
    test "renders sound when data is valid", %{conn: conn} do
      conn = post(conn, Routes.sound_path(conn, :create), sound: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.sound_path(conn, :show, id))

      assert %{
               "id" => id,
               "description" => "some description",
               "higher_bpm" => 42,
               "is_effect" => true,
               "is_enabled" => true,
               "kana" => "some kana",
               "lower_bpm" => 42,
               "title" => "some title",
               "url" => "some url"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.sound_path(conn, :create), sound: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update sound" do
    setup [:create_sound]

    test "renders sound when data is valid", %{conn: conn, sound: %Sound{id: id} = sound} do
      conn = put(conn, Routes.sound_path(conn, :update, sound), sound: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.sound_path(conn, :show, id))

      assert %{
               "id" => id,
               "description" => "some updated description",
               "higher_bpm" => 43,
               "is_effect" => false,
               "is_enabled" => false,
               "kana" => "some updated kana",
               "lower_bpm" => 43,
               "title" => "some updated title",
               "url" => "some updated url"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, sound: sound} do
      conn = put(conn, Routes.sound_path(conn, :update, sound), sound: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete sound" do
    setup [:create_sound]

    test "deletes chosen sound", %{conn: conn, sound: sound} do
      conn = delete(conn, Routes.sound_path(conn, :delete, sound))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.sound_path(conn, :show, sound))
      end
    end
  end

  defp create_sound(_) do
    sound = fixture(:sound)
    {:ok, sound: sound}
  end
end
