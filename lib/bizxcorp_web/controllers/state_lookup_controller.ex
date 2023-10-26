defmodule BizxcorpWeb.StateLookupController do
  use BizxcorpWeb, :controller

  alias Bizxcorp.Addresses
  alias Bizxcorp.Addresses.StateLookup

  action_fallback BizxcorpWeb.FallbackController

  def index(conn, _params) do
    state_lookup = Addresses.list_state_lookup()
    render(conn, :index, state_lookup: state_lookup)
  end

  def create(conn, %{"state_lookup" => state_lookup_params}) do
    with {:ok, %StateLookup{} = state_lookup} <- Addresses.create_state_lookup(state_lookup_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/state_lookup/#{state_lookup}")
      |> render(:show, state_lookup: state_lookup)
    end
  end

  def show(conn, %{"id" => id}) do
    state_lookup = Addresses.get_state_lookup!(id)
    render(conn, :show, state_lookup: state_lookup)
  end

  def update(conn, %{"id" => id, "state_lookup" => state_lookup_params}) do
    state_lookup = Addresses.get_state_lookup!(id)

    with {:ok, %StateLookup{} = state_lookup} <- Addresses.update_state_lookup(state_lookup, state_lookup_params) do
      render(conn, :show, state_lookup: state_lookup)
    end
  end

  def delete(conn, %{"id" => id}) do
    state_lookup = Addresses.get_state_lookup!(id)

    with {:ok, %StateLookup{}} <- Addresses.delete_state_lookup(state_lookup) do
      send_resp(conn, :no_content, "")
    end
  end
end
