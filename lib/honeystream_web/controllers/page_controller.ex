defmodule HoneystreamWeb.PageController do
  use HoneystreamWeb, :controller

  def index(conn, _params) do
     conn
      |> render("app.html")
  end
end