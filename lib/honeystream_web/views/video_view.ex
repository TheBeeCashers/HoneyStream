defmodule HoneystreamWeb.VideoView do
  use HoneystreamWeb, :view
  alias HoneystreamWeb.VideoView

  def render("index.json", %{videos: videos}) do
    %{data: render_many(videos, VideoView, "video.json")}
  end

  def render("show.json", %{video: video}) do
    %{data: render_one(video, VideoView, "video.json")}
  end

  def render("payment.json", %{success: payment_done}) do
    %{payment: payment_done}
  end

  def render("video.json", %{video: video}) do
    %{id: video.id,
      title: video.title,
      filename_high: video.filename_high,
      filename_low: video.filename_low,
      content_type: video.content_type,
      path_high: video.path_high,
      path_low: video.path_low}
  end
end
