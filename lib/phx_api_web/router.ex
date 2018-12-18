defmodule PhxApiWeb.Router do
  use PhxApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
    plug CORSPlug, origin: "http://localhost:3000"
  end

  scope "/api", PhxApiWeb do
    pipe_through :api

    get "/sounds", SoundController, :show_enabled
    get "/history/:num", ReleaseHistoryController, :show_some
  end

  scope "/api/master", PhxApiWeb do
    pipe_through :api

    resources "/sound", SoundController, except: [:new, :edit]
    resources "/history", ReleaseHistoryController, except: [:new, :edit]
  end
end
