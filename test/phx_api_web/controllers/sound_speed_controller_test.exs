defmodule PhxApiWeb.SoundSpeedControllerTest do
  use PhxApiWeb.ConnCase

  alias PhxApi.Sounds
  alias PhxApi.Sounds.SoundSpeed

  @create_attrs %{
    is_enabled: true,
    sound_id: 42,
    speed_id: 42
  }
  @update_attrs %{
    is_enabled: false,
    sound_id: 43,
    speed_id: 43
  }
  @invalid_attrs %{is_enabled: nil, sound_id: nil, speed_id: nil}

  def fixture(:sound_speed) do
    {:ok, sound_speed} = Sounds.create_sound_speed(@create_attrs)
    sound_speed
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all sound_speed", %{conn: conn} do
      conn = get(conn, Routes.sound_speed_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create sound_speed" do
    test "renders sound_speed when data is valid", %{conn: conn} do
      conn = post(conn, Routes.sound_speed_path(conn, :create), sound_speed: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.sound_speed_path(conn, :show, id))

      assert %{
               "id" => id,
               "is_enabled" => true,
               "sound_id" => 42,
               "speed_id" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.sound_speed_path(conn, :create), sound_speed: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update sound_speed" do
    setup [:create_sound_speed]

    test "renders sound_speed when data is valid", %{conn: conn, sound_speed: %SoundSpeed{id: id} = sound_speed} do
      conn = put(conn, Routes.sound_speed_path(conn, :update, sound_speed), sound_speed: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.sound_speed_path(conn, :show, id))

      assert %{
               "id" => id,
               "is_enabled" => false,
               "sound_id" => 43,
               "speed_id" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, sound_speed: sound_speed} do
      conn = put(conn, Routes.sound_speed_path(conn, :update, sound_speed), sound_speed: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete sound_speed" do
    setup [:create_sound_speed]

    test "deletes chosen sound_speed", %{conn: conn, sound_speed: sound_speed} do
      conn = delete(conn, Routes.sound_speed_path(conn, :delete, sound_speed))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.sound_speed_path(conn, :show, sound_speed))
      end
    end
  end

  defp create_sound_speed(_) do
    sound_speed = fixture(:sound_speed)
    {:ok, sound_speed: sound_speed}
  end
end
