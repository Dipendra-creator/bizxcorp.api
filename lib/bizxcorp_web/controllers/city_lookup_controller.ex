defmodule BizxcorpWeb.CityLookupController do
  use BizxcorpWeb, :controller

  alias Bizxcorp.Addresses
  alias Bizxcorp.Addresses.CityLookup

  action_fallback BizxcorpWeb.FallbackController

  def index(conn, _params) do
    city_lookup = Addresses.list_city_lookup()
    render(conn, :index, city_lookup: city_lookup)
  end

  def create(conn, %{"city_lookup" => city_lookup_params}) do
    with {:ok, %CityLookup{} = city_lookup} <- Addresses.create_city_lookup(city_lookup_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/city_lookup/#{city_lookup}")
      |> render(:show, city_lookup: city_lookup)
    end
  end

  def show(conn, %{"id" => id}) do
    city_lookup = Addresses.get_city_lookup!(id)
    render(conn, :show, city_lookup: city_lookup)
  end

  def update(conn, %{"id" => id, "city_lookup" => city_lookup_params}) do
    city_lookup = Addresses.get_city_lookup!(id)

    with {:ok, %CityLookup{} = city_lookup} <- Addresses.update_city_lookup(city_lookup, city_lookup_params) do
      render(conn, :show, city_lookup: city_lookup)
    end
  end

  def delete(conn, %{"id" => id}) do
    city_lookup = Addresses.get_city_lookup!(id)

    with {:ok, %CityLookup{}} <- Addresses.delete_city_lookup(city_lookup) do
      send_resp(conn, :no_content, "")
    end
  end
end
