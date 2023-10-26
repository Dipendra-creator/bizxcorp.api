defmodule BizxcorpWeb.CountryLookupJSON do
  alias Bizxcorp.Addresses.CountryLookup

  @doc """
  Renders a list of country_lookup.
  """
  def index(%{country_lookup: country_lookup}) do
    %{data: for(country_lookup <- country_lookup, do: data(country_lookup))}
  end

  @doc """
  Renders a single country_lookup.
  """
  def show(%{country_lookup: country_lookup}) do
    %{data: data(country_lookup)}
  end

  defp data(%CountryLookup{} = country_lookup) do
    %{
      id: country_lookup.id,
      country_name: country_lookup.country_name,
      country_code: country_lookup.country_code
    }
  end
end
