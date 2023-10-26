defmodule BizxcorpWeb.OrganizationControllerTest do
  use BizxcorpWeb.ConnCase

  import Bizxcorp.OrganizationsFixtures

  alias Bizxcorp.Organizations.Organization

  @create_attrs %{
    description: "some description",
    name: "some name",
    number_of_employees: 42,
    tag: "some tag"
  }
  @update_attrs %{
    description: "some updated description",
    name: "some updated name",
    number_of_employees: 43,
    tag: "some updated tag"
  }
  @invalid_attrs %{description: nil, name: nil, number_of_employees: nil, tag: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all organization", %{conn: conn} do
      conn = get(conn, ~p"/api/organization")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create organization" do
    test "renders organization when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/organization", organization: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/organization/#{id}")

      assert %{
               "id" => ^id,
               "description" => "some description",
               "name" => "some name",
               "number_of_employees" => 42,
               "tag" => "some tag"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/organization", organization: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update organization" do
    setup [:create_organization]

    test "renders organization when data is valid", %{conn: conn, organization: %Organization{id: id} = organization} do
      conn = put(conn, ~p"/api/organization/#{organization}", organization: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/organization/#{id}")

      assert %{
               "id" => ^id,
               "description" => "some updated description",
               "name" => "some updated name",
               "number_of_employees" => 43,
               "tag" => "some updated tag"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, organization: organization} do
      conn = put(conn, ~p"/api/organization/#{organization}", organization: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete organization" do
    setup [:create_organization]

    test "deletes chosen organization", %{conn: conn, organization: organization} do
      conn = delete(conn, ~p"/api/organization/#{organization}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/organization/#{organization}")
      end
    end
  end

  defp create_organization(_) do
    organization = organization_fixture()
    %{organization: organization}
  end
end
