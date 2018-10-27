defmodule HoneystreamWeb.Router do
  use HoneystreamWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", HoneystreamWeb do
    pipe_through :api

    resources("/videos", VideoController, only: [:index, :show])
    get("/video/:id/payment/:user", VideoController, :check_payment)
  end

  scope "/", HoneystreamWeb do
    # Use the default browser stack
    pipe_through(:browser)

    get("/", PageController, :index)
    get("/watch/:id/high", WatchController, :stream_high)
    get("/watch/:id", WatchController, :stream_low)
  end

end

