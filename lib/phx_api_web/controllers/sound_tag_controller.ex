defmodule PhxApiWeb.SoundTagController do
  use PhxApiWeb, :controller

  alias PhxApi.Sounds
  alias PhxApi.Sounds.SoundTag

  action_fallback PhxApiWeb.FallbackController

  def show_tags(conn, %{"id" => id}) do
    sound = Sounds.get_sound!(id)
    category = Sounds.SoundCategory

  end

end
