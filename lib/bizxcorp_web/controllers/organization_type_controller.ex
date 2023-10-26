defmodule BizxcorpWeb.OrganizationTypeController do
  use BizxcorpWeb, :controller

  alias Bizxcorp.Organizations
  alias Bizxcorp.Organizations.OrganizationType

  action_fallback BizxcorpWeb.FallbackController

  def index(conn, _params) do
    organization_type = Organizations.list_organization_type()
    render(conn, :index, organization_type: organization_type)
  end

  def create(conn, %{"organization_type" => organization_type_params}) do
    with {:ok, %OrganizationType{} = organization_type} <- Organizations.create_organization_type(organization_type_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/organization_type/#{organization_type}")
      |> render(:show, organization_type: organization_type)
    end
  end

  def show(conn, %{"id" => id}) do
    organization_type = Organizations.get_organization_type!(id)
    render(conn, :show, organization_type: organization_type)
  end

  def update(conn, %{"id" => id, "organization_type" => organization_type_params}) do
    organization_type = Organizations.get_organization_type!(id)

    with {:ok, %OrganizationType{} = organization_type} <- Organizations.update_organization_type(organization_type, organization_type_params) do
      render(conn, :show, organization_type: organization_type)
    end
  end

  def delete(conn, %{"id" => id}) do
    organization_type = Organizations.get_organization_type!(id)

    with {:ok, %OrganizationType{}} <- Organizations.delete_organization_type(organization_type) do
      send_resp(conn, :no_content, "")
    end
  end
end
