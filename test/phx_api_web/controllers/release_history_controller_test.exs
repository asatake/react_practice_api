defmodule PhxApiWeb.ReleaseHistoryControllerTest do
  use PhxApiWeb.ConnCase

  alias PhxApi.Histories
  alias PhxApi.Histories.ReleaseHistory

  @create_attrs %{
    description: "some description"
  }
  @update_attrs %{
    description: "some updated description"
  }
  @invalid_attrs %{description: nil}

  def fixture(:release_history) do
    {:ok, release_history} = Histories.create_release_history(@create_attrs)
    release_history
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all release_history", %{conn: conn} do
      conn = get(conn, Routes.release_history_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create release_history" do
    test "renders release_history when data is valid", %{conn: conn} do
      conn = post(conn, Routes.release_history_path(conn, :create), release_history: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.release_history_path(conn, :show, id))

      assert %{
               "id" => id,
               "description" => "some description"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.release_history_path(conn, :create), release_history: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update release_history" do
    setup [:create_release_history]

    test "renders release_history when data is valid", %{conn: conn, release_history: %ReleaseHistory{id: id} = release_history} do
      conn = put(conn, Routes.release_history_path(conn, :update, release_history), release_history: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.release_history_path(conn, :show, id))

      assert %{
               "id" => id,
               "description" => "some updated description"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, release_history: release_history} do
      conn = put(conn, Routes.release_history_path(conn, :update, release_history), release_history: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete release_history" do
    setup [:create_release_history]

    test "deletes chosen release_history", %{conn: conn, release_history: release_history} do
      conn = delete(conn, Routes.release_history_path(conn, :delete, release_history))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.release_history_path(conn, :show, release_history))
      end
    end
  end

  defp create_release_history(_) do
    release_history = fixture(:release_history)
    {:ok, release_history: release_history}
  end
end
