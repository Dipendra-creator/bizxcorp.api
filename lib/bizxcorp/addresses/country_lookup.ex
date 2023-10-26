defmodule Bizxcorp.Addresses.CountryLookup do
  use Ecto.Schema
  import Ecto.Changeset

  schema "country_lookup" do
    field :country_code, :string
    field :country_name, :string

    timestamps()
  end

  @doc false
  def changeset(country_lookup, attrs) do
    country_lookup
    |> cast(attrs, [:country_name, :country_code])
    |> validate_required([:country_name, :country_code])
  end
end
