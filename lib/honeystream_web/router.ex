defmodule HoneystreamWeb.Router do
  use HoneystreamWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :embed do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", HoneystreamWeb do
    pipe_through :api

    resources("/videos", VideoController, only: [:index, :show])
    get("/video/:id/payment/:user", VideoController, :check_payment)
    post("/payment", VideoController, :webhook_payment)
  end

  scope "/", HoneystreamWeb do
    # Use the default browser stack
    pipe_through(:browser)

    get("/", PageController, :index)
    get("/upload", PageController, :index)
    get("/user", PageController, :index)
    get("/video/:id", PageController, :index)

    get("/watch/:id/high", WatchController, :stream_high)
    get("/watch/:id", WatchController, :stream_low)
    get("/thumbnail/:id", VideoController, :thumbnail)
  end

  scope "/", HoneystreamWeb do
    pipe_through(:embed)
    get("/embed/:id", PageController, :embed)
  end

end

