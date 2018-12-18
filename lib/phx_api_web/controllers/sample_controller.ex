defmodule PhxApiWeb.SampleController do
  use PhxApiWeb, :controller

  alias PhxApi.Samples
  alias PhxApi.Samples.Sample

  action_fallback PhxApiWeb.FallbackController

  def index(conn, _params) do
    sample = Samples.list_sample()
    render(conn, "index.json", sample: sample)
  end

  def create(conn, %{"sample" => sample_params}) do
    with {:ok, %Sample{} = sample} <- Samples.create_sample(sample_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.sample_path(conn, :show, sample))
      |> render("show.json", sample: sample)
    end
  end

  def show(conn, %{"id" => id}) do
    sample = Samples.get_sample!(id)
    render(conn, "show.json", sample: sample)
  end

  def update(conn, %{"id" => id, "sample" => sample_params}) do
    sample = Samples.get_sample!(id)

    with {:ok, %Sample{} = sample} <- Samples.update_sample(sample, sample_params) do
      render(conn, "show.json", sample: sample)
    end
  end

  def delete(conn, %{"id" => id}) do
    sample = Samples.get_sample!(id)

    with {:ok, %Sample{}} <- Samples.delete_sample(sample) do
      send_resp(conn, :no_content, "")
    end
  end
end
