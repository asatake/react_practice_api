defmodule PhxApiWeb.SpeedController do
  use PhxApiWeb, :controller

  alias PhxApi.Sounds
  alias PhxApi.Sounds.Speed

  action_fallback PhxApiWeb.FallbackController

  def index(conn, _params) do
    speed = Sounds.list_speed()
    render(conn, "index.json", speed: speed)
  end

  def create(conn, %{"speed" => speed_params}) do
    with {:ok, %Speed{} = speed} <- Sounds.create_speed(speed_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.speed_path(conn, :show, speed))
      |> render("show.json", speed: speed)
    end
  end

  def show(conn, %{"id" => id}) do
    speed = Sounds.get_speed!(id)
    render(conn, "show.json", speed: speed)
  end

  def update(conn, %{"id" => id, "speed" => speed_params}) do
    speed = Sounds.get_speed!(id)

    with {:ok, %Speed{} = speed} <- Sounds.update_speed(speed, speed_params) do
      render(conn, "show.json", speed: speed)
    end
  end

  def delete(conn, %{"id" => id}) do
    speed = Sounds.get_speed!(id)

    with {:ok, %Speed{}} <- Sounds.delete_speed(speed) do
      send_resp(conn, :no_content, "")
    end
  end
end
