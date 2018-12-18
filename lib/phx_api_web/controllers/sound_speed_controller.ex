defmodule PhxApiWeb.SoundSpeedController do
  use PhxApiWeb, :controller

  alias PhxApi.Sounds
  alias PhxApi.Sounds.SoundSpeed

  action_fallback PhxApiWeb.FallbackController

  def index(conn, _params) do
    sound_speed = Sounds.list_sound_speed()
    render(conn, "index.json", sound_speed: sound_speed)
  end

  def create(conn, %{"sound_speed" => sound_speed_params}) do
    with {:ok, %SoundSpeed{} = sound_speed} <- Sounds.create_sound_speed(sound_speed_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.sound_speed_path(conn, :show, sound_speed))
      |> render("show.json", sound_speed: sound_speed)
    end
  end

  def show(conn, %{"id" => id}) do
    sound_speed = Sounds.get_sound_speed!(id)
    render(conn, "show.json", sound_speed: sound_speed)
  end

  def update(conn, %{"id" => id, "sound_speed" => sound_speed_params}) do
    sound_speed = Sounds.get_sound_speed!(id)

    with {:ok, %SoundSpeed{} = sound_speed} <- Sounds.update_sound_speed(sound_speed, sound_speed_params) do
      render(conn, "show.json", sound_speed: sound_speed)
    end
  end

  def delete(conn, %{"id" => id}) do
    sound_speed = Sounds.get_sound_speed!(id)

    with {:ok, %SoundSpeed{}} <- Sounds.delete_sound_speed(sound_speed) do
      send_resp(conn, :no_content, "")
    end
  end
end
