defmodule Honeystream.Repo.Migrations.AddPaywallTypeField do
  use Ecto.Migration

  def change do
    alter table(:videos) do
      add :paywall_type, :string
    end
  end
end
