defmodule Honeystream.Repo.Migrations.CreatePayments do
  use Ecto.Migration

  def change do
    create table(:payments) do
      add :user, :string
      add :button_id, :string
      add :video_id, references(:Videos, on_delete: :nothing)

      timestamps()
    end

    create index(:payments, [:video])
  end
end
