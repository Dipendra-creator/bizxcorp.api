defmodule BizxcorpWeb.OrganizationJSON do
  alias Bizxcorp.Organizations.Organization

  @doc """
  Renders a list of organization.
  """
  def index(%{organization: organization}) do
    %{data: for(organization <- organization, do: data(organization))}
  end

  @doc """
  Renders a single organization.
  """
  def show(%{organization: organization}) do
    %{data: data(organization)}
  end

  defp data(%Organization{} = organization) do
    %{
      id: organization.id,
      name: organization.name,
      number_of_employees: organization.number_of_employees,
      description: organization.description,
      tag: organization.tag
    }
  end
end
