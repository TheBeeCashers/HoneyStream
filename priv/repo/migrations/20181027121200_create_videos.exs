defmodule Honeystream.Repo.Migrations.CreateVideos do
  use Ecto.Migration

  def change do
    create table(:videos) do
      add :title, :string
      add :filename_high, :string
      add :filename_low, :string
      add :content_type, :string
      add :path_high, :string
      add :path_low, :string

      timestamps()
    end

  end
end
