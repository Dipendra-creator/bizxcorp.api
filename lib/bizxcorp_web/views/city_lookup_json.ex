defmodule BizxcorpWeb.CityLookupJSON do
  alias Bizxcorp.Addresses.CityLookup

  @doc """
  Renders a list of city_lookup.
  """
  def index(%{city_lookup: city_lookup}) do
    %{data: for(city_lookup <- city_lookup, do: data(city_lookup))}
  end

  @doc """
  Renders a single city_lookup.
  """
  def show(%{city_lookup: city_lookup}) do
    %{data: data(city_lookup)}
  end

  defp data(%CityLookup{} = city_lookup) do
    %{
      id: city_lookup.id,
      city_code: city_lookup.city_code,
      city_name: city_lookup.city_name
    }
  end
end
