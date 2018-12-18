defmodule PhxApiWeb.InstrumentView do
  use PhxApiWeb, :view
  alias PhxApiWeb.InstrumentView

  def render("index.json", %{instrument: instrument}) do
    %{data: render_many(instrument, InstrumentView, "instrument.json")}
  end

  def render("show.json", %{instrument: instrument}) do
    %{data: render_one(instrument, InstrumentView, "instrument.json")}
  end

  def render("instrument.json", %{instrument: instrument}) do
    %{id: instrument.id,
      name: instrument.name,
      is_enabled: instrument.is_enabled}
  end
end
