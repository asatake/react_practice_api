defmodule PhxApiWeb.SoundCategoryView do
  use PhxApiWeb, :view
  alias PhxApiWeb.SoundCategoryView

  def render("index.json", %{sound_category: sound_category}) do
    %{data: render_many(sound_category, SoundCategoryView, "sound_category.json")}
  end

  def render("show.json", %{sound_category: sound_category}) do
    %{data: render_one(sound_category, SoundCategoryView, "sound_category.json")}
  end

  def render("sound_category.json", %{sound_category: sound_category}) do
    %{id: sound_category.id,
      sound_id: sound_category.sound_id,
      category_id: sound_category.category_id,
      is_enabled: sound_category.is_enabled}
  end
end
