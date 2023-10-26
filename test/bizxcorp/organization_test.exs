defmodule Bizxcorp.OrganizationTest do
  use Bizxcorp.DataCase

  alias Bizxcorp.Organization

  describe "organization_type" do
    alias Bizxcorp.Organization.OrganizationType

    import Bizxcorp.OrganizationFixtures

    @invalid_attrs %{description: nil, name: nil}

    test "list_organization_type/0 returns all organization_type" do
      organization_type = organization_type_fixture()
      assert Organization.list_organization_type() == [organization_type]
    end

    test "get_organization_type!/1 returns the organization_type with given id" do
      organization_type = organization_type_fixture()
      assert Organization.get_organization_type!(organization_type.id) == organization_type
    end

    test "create_organization_type/1 with valid data creates a organization_type" do
      valid_attrs = %{description: "some description", name: "some name"}

      assert {:ok, %OrganizationType{} = organization_type} = Organization.create_organization_type(valid_attrs)
      assert organization_type.description == "some description"
      assert organization_type.name == "some name"
    end

    test "create_organization_type/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Organization.create_organization_type(@invalid_attrs)
    end

    test "update_organization_type/2 with valid data updates the organization_type" do
      organization_type = organization_type_fixture()
      update_attrs = %{description: "some updated description", name: "some updated name"}

      assert {:ok, %OrganizationType{} = organization_type} = Organization.update_organization_type(organization_type, update_attrs)
      assert organization_type.description == "some updated description"
      assert organization_type.name == "some updated name"
    end

    test "update_organization_type/2 with invalid data returns error changeset" do
      organization_type = organization_type_fixture()
      assert {:error, %Ecto.Changeset{}} = Organization.update_organization_type(organization_type, @invalid_attrs)
      assert organization_type == Organization.get_organization_type!(organization_type.id)
    end

    test "delete_organization_type/1 deletes the organization_type" do
      organization_type = organization_type_fixture()
      assert {:ok, %OrganizationType{}} = Organization.delete_organization_type(organization_type)
      assert_raise Ecto.NoResultsError, fn -> Organization.get_organization_type!(organization_type.id) end
    end

    test "change_organization_type/1 returns a organization_type changeset" do
      organization_type = organization_type_fixture()
      assert %Ecto.Changeset{} = Organization.change_organization_type(organization_type)
    end
  end
end
