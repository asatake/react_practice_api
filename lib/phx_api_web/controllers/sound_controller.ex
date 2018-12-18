defmodule PhxApiWeb.SoundController do
  use PhxApiWeb, :controller

  alias PhxApi.Sounds
  alias PhxApi.Sounds.Sound

  action_fallback PhxApiWeb.FallbackController

  def index(conn, _params) do
    sound = Sounds.list_sound()
    render(conn, "index.json", sound: sound)
  end

  def create(conn, %{"sound" => sound_params}) do
    with {:ok, %Sound{} = sound} <- Sounds.create_sound(sound_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.sound_path(conn, :show, sound))
      |> render("show.json", sound: sound)
    end
  end

  def show(conn, %{"id" => id}) do
    sound = Sounds.get_sound!(id)
    render(conn, "show.json", sound: sound)
  end

  def update(conn, %{"id" => id, "sound" => sound_params}) do
    sound = Sounds.get_sound!(id)

    with {:ok, %Sound{} = sound} <- Sounds.update_sound(sound, sound_params) do
      render(conn, "show.json", sound: sound)
    end
  end

  def delete(conn, %{"id" => id}) do
    sound = Sounds.get_sound!(id)

    with {:ok, %Sound{}} <- Sounds.delete_sound(sound) do
      send_resp(conn, :no_content, "")
    end
  end

  def show_enabled(conn, _params) do
    sound = Sounds.list_enabled_sound()
    render(conn, "index.json", sound: sound)
  end
end
