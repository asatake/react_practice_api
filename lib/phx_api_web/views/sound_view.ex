defmodule PhxApiWeb.SoundView do
  use PhxApiWeb, :view
  alias PhxApiWeb.SoundView

  def render("index.json", %{sound: sound}) do
    %{data: render_many(sound, SoundView, "sound.json")}
  end

  def render("show.json", %{sound: sound}) do
    %{data: render_one(sound, SoundView, "sound.json")}
  end

  def render("sound.json", %{sound: sound}) do
    %{id: sound.id,
      title: sound.title,
      kana: sound.kana,
      url: sound.url,
      lower_bpm: sound.lower_bpm,
      higher_bpm: sound.higher_bpm,
      description: sound.description,
      is_effect: sound.is_effect,
      is_enabled: sound.is_enabled,
      inserted_at: sound.inserted_at,
      updated_at: sound.updated_at}
  end
end
