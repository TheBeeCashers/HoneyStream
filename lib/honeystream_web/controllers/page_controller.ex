defmodule HoneystreamWeb.PageController do
  use HoneystreamWeb, :controller

  def index(conn, _params) do
     conn
      |> render("app.html")
  end

  def embed(conn, _params) do
    conn
    |> render("embed.html")
  end
end