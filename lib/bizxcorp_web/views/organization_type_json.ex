defmodule BizxcorpWeb.OrganizationTypeJSON do
  alias Bizxcorp.Organizations.OrganizationType

  @doc """
  Renders a list of organization_type.
  """
  def index(%{organization_type: organization_type}) do
    %{data: for(organization_type <- organization_type, do: data(organization_type))}
  end

  @doc """
  Renders a single organization_type.
  """
  def show(%{organization_type: organization_type}) do
    %{data: data(organization_type)}
  end

  defp data(%OrganizationType{} = organization_type) do
    %{
      id: organization_type.id,
      name: organization_type.name,
      description: organization_type.description
    }
  end
end
