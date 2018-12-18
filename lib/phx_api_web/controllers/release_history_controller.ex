defmodule PhxApiWeb.ReleaseHistoryController do
  use PhxApiWeb, :controller

  alias PhxApi.Histories
  alias PhxApi.Histories.ReleaseHistory

  action_fallback PhxApiWeb.FallbackController

  def index(conn, _params) do
    release_history = Histories.list_release_history()
    render(conn, "index.json", release_history: release_history)
  end

  def create(conn, %{"release_history" => release_history_params}) do
    with {:ok, %ReleaseHistory{} = release_history} <- Histories.create_release_history(release_history_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.release_history_path(conn, :show, release_history))
      |> render("show.json", release_history: release_history)
    end
  end

  def show(conn, %{"id" => id}) do
    release_history = Histories.get_release_history!(id)
    render(conn, "show.json", release_history: release_history)
  end

  def show_some(conn, %{"num" => num}) do
    release_history = Histories.get_release_history_some!(num)
    render(conn, "index.json", release_history: release_history)
  end

  def update(conn, %{"id" => id, "release_history" => release_history_params}) do
    release_history = Histories.get_release_history!(id)

    with {:ok, %ReleaseHistory{} = release_history} <- Histories.update_release_history(release_history, release_history_params) do
      render(conn, "show.json", release_history: release_history)
    end
  end

  def delete(conn, %{"id" => id}) do
    release_history = Histories.get_release_history!(id)

    with {:ok, %ReleaseHistory{}} <- Histories.delete_release_history(release_history) do
      send_resp(conn, :no_content, "")
    end
  end
end
