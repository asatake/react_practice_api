defmodule PhxApiWeb.ReleaseHistoryView do
  use PhxApiWeb, :view
  alias PhxApiWeb.ReleaseHistoryView

  def render("index.json", %{release_history: release_history}) do
    %{data: render_many(release_history, ReleaseHistoryView, "release_history.json")}
  end

  def render("show.json", %{release_history: release_history}) do
    %{data: render_one(release_history, ReleaseHistoryView, "release_history.json")}
  end

  def render("release_history.json", %{release_history: release_history}) do
    %{id: release_history.id,
      description: release_history.description,
      inserted_at: release_history.inserted_at,
      updated_at: release_history.updated_at
    }
  end
end
