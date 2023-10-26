defmodule Bizxcorp.OrganizationsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Bizxcorp.Organizations` context.
  """

  @doc """
  Generate a organization_type.
  """
  def organization_type_fixture(attrs \\ %{}) do
    {:ok, organization_type} =
      attrs
      |> Enum.into(%{
        description: "some description",
        name: "some name"
      })
      |> Bizxcorp.Organizations.create_organization_type()

    organization_type
  end

  @doc """
  Generate a organization.
  """
  def organization_fixture(attrs \\ %{}) do
    {:ok, organization} =
      attrs
      |> Enum.into(%{
        description: "some description",
        name: "some name",
        number_of_employees: 42,
        tag: "some tag"
      })
      |> Bizxcorp.Organizations.create_organization()

    organization
  end
end
