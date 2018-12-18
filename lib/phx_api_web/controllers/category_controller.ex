defmodule PhxApiWeb.CategoryController do
  use PhxApiWeb, :controller

  alias PhxApi.Sounds
  alias PhxApi.Sounds.Category

  action_fallback PhxApiWeb.FallbackController

  def index(conn, _params) do
    category = Sounds.list_category()
    render(conn, "index.json", category: category)
  end

  def create(conn, %{"category" => category_params}) do
    with {:ok, %Category{} = category} <- Sounds.create_category(category_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.category_path(conn, :show, category))
      |> render("show.json", category: category)
    end
  end

  def show(conn, %{"id" => id}) do
    category = Sounds.get_category!(id)
    render(conn, "show.json", category: category)
  end

  def update(conn, %{"id" => id, "category" => category_params}) do
    category = Sounds.get_category!(id)

    with {:ok, %Category{} = category} <- Sounds.update_category(category, category_params) do
      render(conn, "show.json", category: category)
    end
  end

  def delete(conn, %{"id" => id}) do
    category = Sounds.get_category!(id)

    with {:ok, %Category{}} <- Sounds.delete_category(category) do
      send_resp(conn, :no_content, "")
    end
  end
end
