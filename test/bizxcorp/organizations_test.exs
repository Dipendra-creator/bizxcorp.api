defmodule Bizxcorp.OrganizationsTest do
  use Bizxcorp.DataCase

  alias Bizxcorp.Organizations

  describe "organization_type" do
    alias Bizxcorp.Organizations.OrganizationType

    import Bizxcorp.OrganizationsFixtures

    @invalid_attrs %{description: nil, name: nil}

    test "list_organization_type/0 returns all organization_type" do
      organization_type = organization_type_fixture()
      assert Organizations.list_organization_type() == [organization_type]
    end

    test "get_organization_type!/1 returns the organization_type with given id" do
      organization_type = organization_type_fixture()
      assert Organizations.get_organization_type!(organization_type.id) == organization_type
    end

    test "create_organization_type/1 with valid data creates a organization_type" do
      valid_attrs = %{description: "some description", name: "some name"}

      assert {:ok, %OrganizationType{} = organization_type} = Organizations.create_organization_type(valid_attrs)
      assert organization_type.description == "some description"
      assert organization_type.name == "some name"
    end

    test "create_organization_type/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Organizations.create_organization_type(@invalid_attrs)
    end

    test "update_organization_type/2 with valid data updates the organization_type" do
      organization_type = organization_type_fixture()
      update_attrs = %{description: "some updated description", name: "some updated name"}

      assert {:ok, %OrganizationType{} = organization_type} = Organizations.update_organization_type(organization_type, update_attrs)
      assert organization_type.description == "some updated description"
      assert organization_type.name == "some updated name"
    end

    test "update_organization_type/2 with invalid data returns error changeset" do
      organization_type = organization_type_fixture()
      assert {:error, %Ecto.Changeset{}} = Organizations.update_organization_type(organization_type, @invalid_attrs)
      assert organization_type == Organizations.get_organization_type!(organization_type.id)
    end

    test "delete_organization_type/1 deletes the organization_type" do
      organization_type = organization_type_fixture()
      assert {:ok, %OrganizationType{}} = Organizations.delete_organization_type(organization_type)
      assert_raise Ecto.NoResultsError, fn -> Organizations.get_organization_type!(organization_type.id) end
    end

    test "change_organization_type/1 returns a organization_type changeset" do
      organization_type = organization_type_fixture()
      assert %Ecto.Changeset{} = Organizations.change_organization_type(organization_type)
    end
  end

  describe "organization" do
    alias Bizxcorp.Organizations.Organization

    import Bizxcorp.OrganizationsFixtures

    @invalid_attrs %{description: nil, name: nil, number_of_employees: nil, tag: nil}

    test "list_organization/0 returns all organization" do
      organization = organization_fixture()
      assert Organizations.list_organization() == [organization]
    end

    test "get_organization!/1 returns the organization with given id" do
      organization = organization_fixture()
      assert Organizations.get_organization!(organization.id) == organization
    end

    test "create_organization/1 with valid data creates a organization" do
      valid_attrs = %{description: "some description", name: "some name", number_of_employees: 42, tag: "some tag"}

      assert {:ok, %Organization{} = organization} = Organizations.create_organization(valid_attrs)
      assert organization.description == "some description"
      assert organization.name == "some name"
      assert organization.number_of_employees == 42
      assert organization.tag == "some tag"
    end

    test "create_organization/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Organizations.create_organization(@invalid_attrs)
    end

    test "update_organization/2 with valid data updates the organization" do
      organization = organization_fixture()
      update_attrs = %{description: "some updated description", name: "some updated name", number_of_employees: 43, tag: "some updated tag"}

      assert {:ok, %Organization{} = organization} = Organizations.update_organization(organization, update_attrs)
      assert organization.description == "some updated description"
      assert organization.name == "some updated name"
      assert organization.number_of_employees == 43
      assert organization.tag == "some updated tag"
    end

    test "update_organization/2 with invalid data returns error changeset" do
      organization = organization_fixture()
      assert {:error, %Ecto.Changeset{}} = Organizations.update_organization(organization, @invalid_attrs)
      assert organization == Organizations.get_organization!(organization.id)
    end

    test "delete_organization/1 deletes the organization" do
      organization = organization_fixture()
      assert {:ok, %Organization{}} = Organizations.delete_organization(organization)
      assert_raise Ecto.NoResultsError, fn -> Organizations.get_organization!(organization.id) end
    end

    test "change_organization/1 returns a organization changeset" do
      organization = organization_fixture()
      assert %Ecto.Changeset{} = Organizations.change_organization(organization)
    end
  end
end
