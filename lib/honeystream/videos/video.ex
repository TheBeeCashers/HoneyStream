defmodule Honeystream.Videos.Video do
  use Ecto.Schema
  import Ecto.Changeset

  schema "videos" do
    field :content_type, :string
    field :filename_high, :string
    field :filename_low, :string
    field :path_high, :string
    field :path_low, :string
    field :title, :string
    field :video_file, :any, virtual: true

    timestamps()
  end

  @doc false
  def changeset(video, attrs) do
    video
    |> cast(attrs, [:title, :filename_high, :filename_low, :content_type, :path_high, :path_low])
    |> validate_required([:title, :video_file])
  end
end
