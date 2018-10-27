defmodule Honeystream.Videos.Payment do
  use Ecto.Schema
  import Ecto.Changeset

  schema "payments" do
    field :button_id, :string
    field :user, :string
    belongs_to :video, Honeystream.Videos.Video

    timestamps()
  end

  @doc false
  def changeset(payment, attrs) do
    payment
    |> cast(attrs, [:user, :button_id])
    |> validate_required([:user, :button_id])
  end
end
