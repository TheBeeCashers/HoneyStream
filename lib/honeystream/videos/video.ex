defmodule Honeystream.Videos.Video do
  use Ecto.Schema
  import Ecto.Changeset

  @paywall_preview "preview"
  @paywall_quality "quality"

  defmacro paywall_preview, do: @paywall_preview
  defmacro paywall_quality, do: @paywall_quality

  schema "videos" do
    field :content_type, :string
    field :filename_high, :string
    field :filename_low, :string
    field :path_high, :string
    field :path_low, :string
    field :title, :string
    field :description, :string
    field :thumbnail_id, :string
    field :creator_address, :string
    field :paywall_type, :string
    field :video_file, :any, virtual: true
    has_many :payments, Honeystream.Videos.Payment

    timestamps()
  end

  @doc false
  def changeset(video, attrs) do
    video
    |> cast(attrs, [
      :title,
      :filename_high,
      :filename_low,
      :content_type,
      :path_high,
      :path_low,
      :description,
      :thumbnail_id,
      :creator_address,
      :paywall_type,
    ])
    |> validate_required([:title, :video_file])
  end
end
