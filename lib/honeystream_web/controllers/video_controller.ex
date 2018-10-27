defmodule HoneystreamWeb.VideoController do
  use HoneystreamWeb, :controller

  alias Honeystream.Videos
  alias Honeystream.Videos.Video

  action_fallback HoneystreamWeb.FallbackController

  def index(conn, _params) do
    videos = Videos.list_videos()
    render(conn, "index.json", videos: videos)
  end

  def create(conn, %{"video" => video_params}) do
    with {:ok, %Video{} = video} <- Videos.create_video(video_params) do
      conn
      |> put_status(:created)
      #|> put_resp_header("location", video_path(conn, :show, video))
      |> render("show.json", video: video)
    end
  end

  def show(conn, %{"id" => id}) do
    video = Videos.get_video!(id)
    render(conn, "show.json", video: video)
  end

  def update(conn, %{"id" => id, "video" => video_params}) do
    video = Videos.get_video!(id)

    with {:ok, %Video{} = video} <- Videos.update_video(video, video_params) do
      render(conn, "show.json", video: video)
    end
  end

  def delete(conn, %{"id" => id}) do
    video = Videos.get_video!(id)
    with {:ok, %Video{}} <- Videos.delete_video(video) do
      send_resp(conn, :no_content, "")
    end
  end
end
