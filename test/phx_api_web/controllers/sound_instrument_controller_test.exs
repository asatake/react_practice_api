defmodule PhxApiWeb.SoundInstrumentControllerTest do
  use PhxApiWeb.ConnCase

  alias PhxApi.Sounds
  alias PhxApi.Sounds.SoundInstrument

  @create_attrs %{
    instrument_id: 42,
    is_enabled: true,
    sound_id: 42
  }
  @update_attrs %{
    instrument_id: 43,
    is_enabled: false,
    sound_id: 43
  }
  @invalid_attrs %{instrument_id: nil, is_enabled: nil, sound_id: nil}

  def fixture(:sound_instrument) do
    {:ok, sound_instrument} = Sounds.create_sound_instrument(@create_attrs)
    sound_instrument
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all sound_instrument", %{conn: conn} do
      conn = get(conn, Routes.sound_instrument_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create sound_instrument" do
    test "renders sound_instrument when data is valid", %{conn: conn} do
      conn = post(conn, Routes.sound_instrument_path(conn, :create), sound_instrument: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.sound_instrument_path(conn, :show, id))

      assert %{
               "id" => id,
               "instrument_id" => 42,
               "is_enabled" => true,
               "sound_id" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.sound_instrument_path(conn, :create), sound_instrument: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update sound_instrument" do
    setup [:create_sound_instrument]

    test "renders sound_instrument when data is valid", %{conn: conn, sound_instrument: %SoundInstrument{id: id} = sound_instrument} do
      conn = put(conn, Routes.sound_instrument_path(conn, :update, sound_instrument), sound_instrument: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.sound_instrument_path(conn, :show, id))

      assert %{
               "id" => id,
               "instrument_id" => 43,
               "is_enabled" => false,
               "sound_id" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, sound_instrument: sound_instrument} do
      conn = put(conn, Routes.sound_instrument_path(conn, :update, sound_instrument), sound_instrument: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete sound_instrument" do
    setup [:create_sound_instrument]

    test "deletes chosen sound_instrument", %{conn: conn, sound_instrument: sound_instrument} do
      conn = delete(conn, Routes.sound_instrument_path(conn, :delete, sound_instrument))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.sound_instrument_path(conn, :show, sound_instrument))
      end
    end
  end

  defp create_sound_instrument(_) do
    sound_instrument = fixture(:sound_instrument)
    {:ok, sound_instrument: sound_instrument}
  end
end
