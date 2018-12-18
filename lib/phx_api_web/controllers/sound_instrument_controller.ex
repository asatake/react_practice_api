defmodule PhxApiWeb.SoundInstrumentController do
  use PhxApiWeb, :controller

  alias PhxApi.Sounds
  alias PhxApi.Sounds.SoundInstrument

  action_fallback PhxApiWeb.FallbackController

  def index(conn, _params) do
    sound_instrument = Sounds.list_sound_instrument()
    render(conn, "index.json", sound_instrument: sound_instrument)
  end

  def create(conn, %{"sound_instrument" => sound_instrument_params}) do
    with {:ok, %SoundInstrument{} = sound_instrument} <- Sounds.create_sound_instrument(sound_instrument_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.sound_instrument_path(conn, :show, sound_instrument))
      |> render("show.json", sound_instrument: sound_instrument)
    end
  end

  def show(conn, %{"id" => id}) do
    sound_instrument = Sounds.get_sound_instrument!(id)
    render(conn, "show.json", sound_instrument: sound_instrument)
  end

  def update(conn, %{"id" => id, "sound_instrument" => sound_instrument_params}) do
    sound_instrument = Sounds.get_sound_instrument!(id)

    with {:ok, %SoundInstrument{} = sound_instrument} <- Sounds.update_sound_instrument(sound_instrument, sound_instrument_params) do
      render(conn, "show.json", sound_instrument: sound_instrument)
    end
  end

  def delete(conn, %{"id" => id}) do
    sound_instrument = Sounds.get_sound_instrument!(id)

    with {:ok, %SoundInstrument{}} <- Sounds.delete_sound_instrument(sound_instrument) do
      send_resp(conn, :no_content, "")
    end
  end
end
