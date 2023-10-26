defmodule BizxcorpWeb.OrganizationController do
  use BizxcorpWeb, :controller

  alias Bizxcorp.Organizations
  alias Bizxcorp.Organizations.Organization

  action_fallback BizxcorpWeb.FallbackController

  def index(conn, _params) do
    organization = Organizations.list_organization()
    render(conn, :index, organization: organization)
  end

  def create(conn, %{"organization" => organization_params}) do
    with {:ok, %Organization{} = organization} <- Organizations.create_organization(organization_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/organization/#{organization}")
      |> render(:show, organization: organization)
    end
  end

  def show(conn, %{"id" => id}) do
    organization = Organizations.get_organization!(id)
    render(conn, :show, organization: organization)
  end

  def update(conn, %{"id" => id, "organization" => organization_params}) do
    organization = Organizations.get_organization!(id)

    with {:ok, %Organization{} = organization} <- Organizations.update_organization(organization, organization_params) do
      render(conn, :show, organization: organization)
    end
  end

  def delete(conn, %{"id" => id}) do
    organization = Organizations.get_organization!(id)

    with {:ok, %Organization{}} <- Organizations.delete_organization(organization) do
      send_resp(conn, :no_content, "")
    end
  end
end
