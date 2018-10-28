defmodule HoneystreamWeb.VideoView do
  use HoneystreamWeb, :view
  alias HoneystreamWeb.VideoView

  def render("index.json", %{videos: videos}) do
    %{data: render_many(videos, VideoView, "video.json")}
  end

  def render("show.json", %{video: video, access: has_access}) do
    %{data: Map.put(render_one(video, VideoView, "video.json"), :access, has_access)}
  end

  def render("payment.json", %{success: payment_done}) do
    %{payment: payment_done}
  end

  def render("video.json", %{video: video}) do
    %{id: video.id,
      title: video.title,
      description: video.description,
      hs_address: Application.get_env(:honeystream, :address),
      creator_address: video.creator_address,
      thumbnail_url: "/thumbnail/" <> video.thumbnail_id,
      paywall_type: video.paywall_type,
    }
  end
end
