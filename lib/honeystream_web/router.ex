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

    get("/videos", VideoController, :index)
  end

  scope "/", HoneystreamWeb do
    # Use the default browser stack
    pipe_through(:browser)

    get("/", PageController, :index)
  end


end
