defmodule BizxcorpWeb.CountryLookupController do
  use BizxcorpWeb, :controller

  alias Bizxcorp.Addresses
  alias Bizxcorp.Addresses.CountryLookup

  action_fallback BizxcorpWeb.FallbackController

  def index(conn, _params) do
    country_lookup = Addresses.list_country_lookup()
    render(conn, :index, country_lookup: country_lookup)
  end

  def create(conn, %{"country_lookup" => country_lookup_params}) do
    with {:ok, %CountryLookup{} = country_lookup} <- Addresses.create_country_lookup(country_lookup_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/country_lookup/#{country_lookup}")
      |> render(:show, country_lookup: country_lookup)
    end
  end

  def show(conn, %{"id" => id}) do
    country_lookup = Addresses.get_country_lookup!(id)
    render(conn, :show, country_lookup: country_lookup)
  end

  def update(conn, %{"id" => id, "country_lookup" => country_lookup_params}) do
    country_lookup = Addresses.get_country_lookup!(id)

    with {:ok, %CountryLookup{} = country_lookup} <- Addresses.update_country_lookup(country_lookup, country_lookup_params) do
      render(conn, :show, country_lookup: country_lookup)
    end
  end

  def delete(conn, %{"id" => id}) do
    country_lookup = Addresses.get_country_lookup!(id)

    with {:ok, %CountryLookup{}} <- Addresses.delete_country_lookup(country_lookup) do
      send_resp(conn, :no_content, "")
    end
  end
end
