defmodule PhxApiWeb.SpeedControllerTest do
  use PhxApiWeb.ConnCase

  alias PhxApi.Sounds
  alias PhxApi.Sounds.Speed

  @create_attrs %{
    is_enabled: true,
    name: "some name"
  }
  @update_attrs %{
    is_enabled: false,
    name: "some updated name"
  }
  @invalid_attrs %{is_enabled: nil, name: nil}

  def fixture(:speed) do
    {:ok, speed} = Sounds.create_speed(@create_attrs)
    speed
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all speed", %{conn: conn} do
      conn = get(conn, Routes.speed_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create speed" do
    test "renders speed when data is valid", %{conn: conn} do
      conn = post(conn, Routes.speed_path(conn, :create), speed: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.speed_path(conn, :show, id))

      assert %{
               "id" => id,
               "is_enabled" => true,
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.speed_path(conn, :create), speed: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update speed" do
    setup [:create_speed]

    test "renders speed when data is valid", %{conn: conn, speed: %Speed{id: id} = speed} do
      conn = put(conn, Routes.speed_path(conn, :update, speed), speed: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.speed_path(conn, :show, id))

      assert %{
               "id" => id,
               "is_enabled" => false,
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, speed: speed} do
      conn = put(conn, Routes.speed_path(conn, :update, speed), speed: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete speed" do
    setup [:create_speed]

    test "deletes chosen speed", %{conn: conn, speed: speed} do
      conn = delete(conn, Routes.speed_path(conn, :delete, speed))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.speed_path(conn, :show, speed))
      end
    end
  end

  defp create_speed(_) do
    speed = fixture(:speed)
    {:ok, speed: speed}
  end
end
