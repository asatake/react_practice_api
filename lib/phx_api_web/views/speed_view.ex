defmodule PhxApiWeb.SpeedView do
  use PhxApiWeb, :view
  alias PhxApiWeb.SpeedView

  def render("index.json", %{speed: speed}) do
    %{data: render_many(speed, SpeedView, "speed.json")}
  end

  def render("show.json", %{speed: speed}) do
    %{data: render_one(speed, SpeedView, "speed.json")}
  end

  def render("speed.json", %{speed: speed}) do
    %{id: speed.id,
      name: speed.name,
      is_enabled: speed.is_enabled}
  end
end
