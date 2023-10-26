defmodule BizxcorpWeb.OrganizationTypeControllerTest do
  use BizxcorpWeb.ConnCase

  import Bizxcorp.OrganizationsFixtures

  alias Bizxcorp.Organizations.OrganizationType

  @create_attrs %{
    description: "some description",
    name: "some name"
  }
  @update_attrs %{
    description: "some updated description",
    name: "some updated name"
  }
  @invalid_attrs %{description: nil, name: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all organization_type", %{conn: conn} do
      conn = get(conn, ~p"/api/organization_type")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create organization_type" do
    test "renders organization_type when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/organization_type", organization_type: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/organization_type/#{id}")

      assert %{
               "id" => ^id,
               "description" => "some description",
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/organization_type", organization_type: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update organization_type" do
    setup [:create_organization_type]

    test "renders organization_type when data is valid", %{conn: conn, organization_type: %OrganizationType{id: id} = organization_type} do
      conn = put(conn, ~p"/api/organization_type/#{organization_type}", organization_type: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/organization_type/#{id}")

      assert %{
               "id" => ^id,
               "description" => "some updated description",
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, organization_type: organization_type} do
      conn = put(conn, ~p"/api/organization_type/#{organization_type}", organization_type: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete organization_type" do
    setup [:create_organization_type]

    test "deletes chosen organization_type", %{conn: conn, organization_type: organization_type} do
      conn = delete(conn, ~p"/api/organization_type/#{organization_type}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/organization_type/#{organization_type}")
      end
    end
  end

  defp create_organization_type(_) do
    organization_type = organization_type_fixture()
    %{organization_type: organization_type}
  end
end
