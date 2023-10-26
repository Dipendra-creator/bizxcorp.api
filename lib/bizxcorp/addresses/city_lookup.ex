defmodule Bizxcorp.Addresses.CityLookup do
  use Ecto.Schema
  import Ecto.Changeset

  schema "city_lookup" do
    field :city_code, :string
    field :city_name, :string
    field :state_id, :id
    field :country_id, :id

    timestamps()
  end

  @doc false
  def changeset(city_lookup, attrs) do
    city_lookup
    |> cast(attrs, [:city_code, :city_name])
    |> validate_required([:city_code, :city_name])
  end
end
