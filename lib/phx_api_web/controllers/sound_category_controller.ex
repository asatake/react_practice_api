defmodule PhxApiWeb.SoundCategoryController do
  use PhxApiWeb, :controller

  alias PhxApi.Sounds
  alias PhxApi.Sounds.SoundCategory

  action_fallback PhxApiWeb.FallbackController

  def index(conn, _params) do
    sound_category = Sounds.list_sound_category()
    render(conn, "index.json", sound_category: sound_category)
  end

  def create(conn, %{"sound_category" => sound_category_params}) do
    with {:ok, %SoundCategory{} = sound_category} <- Sounds.create_sound_category(sound_category_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.sound_category_path(conn, :show, sound_category))
      |> render("show.json", sound_category: sound_category)
    end
  end

  def show(conn, %{"id" => id}) do
    sound_category = Sounds.get_sound_category!(id)
    render(conn, "show.json", sound_category: sound_category)
  end

  def update(conn, %{"id" => id, "sound_category" => sound_category_params}) do
    sound_category = Sounds.get_sound_category!(id)

    with {:ok, %SoundCategory{} = sound_category} <- Sounds.update_sound_category(sound_category, sound_category_params) do
      render(conn, "show.json", sound_category: sound_category)
    end
  end

  def delete(conn, %{"id" => id}) do
    sound_category = Sounds.get_sound_category!(id)

    with {:ok, %SoundCategory{}} <- Sounds.delete_sound_category(sound_category) do
      send_resp(conn, :no_content, "")
    end
  end
end
