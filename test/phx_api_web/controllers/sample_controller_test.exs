defmodule PhxApiWeb.SampleControllerTest do
  use PhxApiWeb.ConnCase

  alias PhxApi.Samples
  alias PhxApi.Samples.Sample

  @create_attrs %{
    body: "some body",
    is_enabled: true,
    title: "some title"
  }
  @update_attrs %{
    body: "some updated body",
    is_enabled: false,
    title: "some updated title"
  }
  @invalid_attrs %{body: nil, is_enabled: nil, title: nil}

  def fixture(:sample) do
    {:ok, sample} = Samples.create_sample(@create_attrs)
    sample
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all sample", %{conn: conn} do
      conn = get(conn, Routes.sample_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create sample" do
    test "renders sample when data is valid", %{conn: conn} do
      conn = post(conn, Routes.sample_path(conn, :create), sample: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.sample_path(conn, :show, id))

      assert %{
               "id" => id,
               "body" => "some body",
               "is_enabled" => true,
               "title" => "some title"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.sample_path(conn, :create), sample: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update sample" do
    setup [:create_sample]

    test "renders sample when data is valid", %{conn: conn, sample: %Sample{id: id} = sample} do
      conn = put(conn, Routes.sample_path(conn, :update, sample), sample: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.sample_path(conn, :show, id))

      assert %{
               "id" => id,
               "body" => "some updated body",
               "is_enabled" => false,
               "title" => "some updated title"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, sample: sample} do
      conn = put(conn, Routes.sample_path(conn, :update, sample), sample: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete sample" do
    setup [:create_sample]

    test "deletes chosen sample", %{conn: conn, sample: sample} do
      conn = delete(conn, Routes.sample_path(conn, :delete, sample))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.sample_path(conn, :show, sample))
      end
    end
  end

  defp create_sample(_) do
    sample = fixture(:sample)
    {:ok, sample: sample}
  end
end
