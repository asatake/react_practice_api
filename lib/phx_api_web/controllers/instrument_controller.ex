defmodule PhxApiWeb.InstrumentController do
  use PhxApiWeb, :controller

  alias PhxApi.Sounds
  alias PhxApi.Sounds.Instrument

  action_fallback PhxApiWeb.FallbackController

  def index(conn, _params) do
    instrument = Sounds.list_instrument()
    render(conn, "index.json", instrument: instrument)
  end

  def create(conn, %{"instrument" => instrument_params}) do
    with {:ok, %Instrument{} = instrument} <- Sounds.create_instrument(instrument_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.instrument_path(conn, :show, instrument))
      |> render("show.json", instrument: instrument)
    end
  end

  def show(conn, %{"id" => id}) do
    instrument = Sounds.get_instrument!(id)
    render(conn, "show.json", instrument: instrument)
  end

  def update(conn, %{"id" => id, "instrument" => instrument_params}) do
    instrument = Sounds.get_instrument!(id)

    with {:ok, %Instrument{} = instrument} <- Sounds.update_instrument(instrument, instrument_params) do
      render(conn, "show.json", instrument: instrument)
    end
  end

  def delete(conn, %{"id" => id}) do
    instrument = Sounds.get_instrument!(id)

    with {:ok, %Instrument{}} <- Sounds.delete_instrument(instrument) do
      send_resp(conn, :no_content, "")
    end
  end
end
