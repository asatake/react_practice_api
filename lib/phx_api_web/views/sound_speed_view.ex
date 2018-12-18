defmodule PhxApiWeb.SoundSpeedView do
  use PhxApiWeb, :view
  alias PhxApiWeb.SoundSpeedView

  def render("index.json", %{sound_speed: sound_speed}) do
    %{data: render_many(sound_speed, SoundSpeedView, "sound_speed.json")}
  end

  def render("show.json", %{sound_speed: sound_speed}) do
    %{data: render_one(sound_speed, SoundSpeedView, "sound_speed.json")}
  end

  def render("sound_speed.json", %{sound_speed: sound_speed}) do
    %{id: sound_speed.id,
      sound_id: sound_speed.sound_id,
      speed_id: sound_speed.speed_id,
      is_enabled: sound_speed.is_enabled}
  end
end
