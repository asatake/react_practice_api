defmodule PhxApiWeb.SoundInstrumentView do
  use PhxApiWeb, :view
  alias PhxApiWeb.SoundInstrumentView

  def render("index.json", %{sound_instrument: sound_instrument}) do
    %{data: render_many(sound_instrument, SoundInstrumentView, "sound_instrument.json")}
  end

  def render("show.json", %{sound_instrument: sound_instrument}) do
    %{data: render_one(sound_instrument, SoundInstrumentView, "sound_instrument.json")}
  end

  def render("sound_instrument.json", %{sound_instrument: sound_instrument}) do
    %{id: sound_instrument.id,
      sound_id: sound_instrument.sound_id,
      instrument_id: sound_instrument.instrument_id,
      is_enabled: sound_instrument.is_enabled}
  end
end
