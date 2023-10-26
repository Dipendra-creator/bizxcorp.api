defmodule Bizxcorp.Addresses.StateLookup do
  use Ecto.Schema
  import Ecto.Changeset

  schema "state_lookup" do
    field :state_code, :string
    field :state_name, :string
    field :country_id, :id

    timestamps()
  end

  @doc false
  def changeset(state_lookup, attrs) do
    state_lookup
    |> cast(attrs, [:state_name, :state_code])
    |> validate_required([:state_name, :state_code])
  end
end
