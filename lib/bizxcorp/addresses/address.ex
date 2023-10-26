defmodule Bizxcorp.Addresses.Address do
  use Ecto.Schema
  import Ecto.Changeset

  schema "address" do
    field :pincode, :string
    field :city_id, :id
    field :state_id, :id
    field :country_id, :id

    timestamps()
  end

  @doc false
  def changeset(address, attrs) do
    address
    |> cast(attrs, [:pincode])
    |> validate_required([:pincode])
  end
end
