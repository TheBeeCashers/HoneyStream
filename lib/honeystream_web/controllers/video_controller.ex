defmodule HoneystreamWeb.VideoController do
  use HoneystreamWeb, :controller

  alias Honeystream.Videos
  alias Honeystream.Videos.Video

  action_fallback HoneystreamWeb.FallbackController

  @webhook_secret Application.get_env(:honeystream, :webhook_secret)

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

  def check_payment(conn, %{"id" => video_id, "user" => user_identifier}) do
    case Videos.get_payment(video_id, user_identifier) do
      nil -> render(conn, "payment.json", success: false)
      video -> render(conn, "payment.json", success: true)
    end
  end

  def thumbnail(conn, %{"id" => id}) do
    thumbnail_path = "videos/" <> id <> ".png"
    
    conn
      |> Plug.Conn.put_resp_header("content-type", "image/png")
      |> Plug.Conn.send_file(200, thumbnail_path)
  end

  def webhook_payment(conn, %{"payment" => payment, "secret" => @webhook_secret}) do
    {:ok, button_data} = Poison.decode(payment["buttonData"])
    {video_id, _} = Integer.parse(button_data["video_id"])
    {:ok, raw} = Poison.encode(payment)
    Videos.upsert_payment(video_id, %{
      user: payment["userId"],
      button_id: payment["buttonId"],
      status: payment["status"],
      raw: raw,
    })
    send_resp(conn, 200, "Thank you...")
  end
  def webhook_payment(conn, _) do
    send_resp(conn, 403, "Won't go!")
  end
end
