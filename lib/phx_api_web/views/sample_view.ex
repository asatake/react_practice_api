defmodule PhxApiWeb.SampleView do
  use PhxApiWeb, :view
  alias PhxApiWeb.SampleView

  def render("index.json", %{sample: sample}) do
    %{data: render_many(sample, SampleView, "sample.json")}
  end

  def render("show.json", %{sample: sample}) do
    %{data: render_one(sample, SampleView, "sample.json")}
  end

  def render("sample.json", %{sample: sample}) do
    %{id: sample.id,
      title: sample.title,
      body: sample.body,
      is_enabled: sample.is_enabled}
  end
end
