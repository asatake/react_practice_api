defmodule PhxApiWeb.SoundCategoryControllerTest do
  use PhxApiWeb.ConnCase

  alias PhxApi.Sounds
  alias PhxApi.Sounds.SoundCategory

  @create_attrs %{
    category_id: 42,
    is_enabled: true,
    sound_id: 42
  }
  @update_attrs %{
    category_id: 43,
    is_enabled: false,
    sound_id: 43
  }
  @invalid_attrs %{category_id: nil, is_enabled: nil, sound_id: nil}

  def fixture(:sound_category) do
    {:ok, sound_category} = Sounds.create_sound_category(@create_attrs)
    sound_category
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all sound_category", %{conn: conn} do
      conn = get(conn, Routes.sound_category_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create sound_category" do
    test "renders sound_category when data is valid", %{conn: conn} do
      conn = post(conn, Routes.sound_category_path(conn, :create), sound_category: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.sound_category_path(conn, :show, id))

      assert %{
               "id" => id,
               "category_id" => 42,
               "is_enabled" => true,
               "sound_id" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.sound_category_path(conn, :create), sound_category: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update sound_category" do
    setup [:create_sound_category]

    test "renders sound_category when data is valid", %{conn: conn, sound_category: %SoundCategory{id: id} = sound_category} do
      conn = put(conn, Routes.sound_category_path(conn, :update, sound_category), sound_category: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.sound_category_path(conn, :show, id))

      assert %{
               "id" => id,
               "category_id" => 43,
               "is_enabled" => false,
               "sound_id" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, sound_category: sound_category} do
      conn = put(conn, Routes.sound_category_path(conn, :update, sound_category), sound_category: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete sound_category" do
    setup [:create_sound_category]

    test "deletes chosen sound_category", %{conn: conn, sound_category: sound_category} do
      conn = delete(conn, Routes.sound_category_path(conn, :delete, sound_category))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.sound_category_path(conn, :show, sound_category))
      end
    end
  end

  defp create_sound_category(_) do
    sound_category = fixture(:sound_category)
    {:ok, sound_category: sound_category}
  end
end
