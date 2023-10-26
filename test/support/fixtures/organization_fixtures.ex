defmodule Bizxcorp.OrganizationFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Bizxcorp.Organization` context.
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
      |> Bizxcorp.Organization.create_organization_type()

    organization_type
  end
end
