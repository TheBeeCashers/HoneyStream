defmodule Honeystream.Repo.Migrations.AddPaymentStatusRaw do
  use Ecto.Migration

  def change do
    alter table(:payments) do
      add :status, :string
      add :raw, :string
    end
  end
end
