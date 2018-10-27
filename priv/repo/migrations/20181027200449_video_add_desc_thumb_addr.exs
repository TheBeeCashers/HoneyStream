defmodule Honeystream.Repo.Migrations.VideoAddDescThumbAddr do
  use Ecto.Migration

  def change do
    alter table(:videos) do
      add :description, :string
      add :thumbnail_id, :string
      add :creator_address, :string
    end

  end
end
