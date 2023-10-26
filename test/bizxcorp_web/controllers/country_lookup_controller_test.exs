defmodule BizxcorpWeb.CountryLookupControllerTest do
  use BizxcorpWeb.ConnCase

  import Bizxcorp.AddressesFixtures

  alias Bizxcorp.Addresses.CountryLookup

  @create_attrs %{
    country_code: "some country_code",
    country_name: "some country_name"
  }
  @update_attrs %{
    country_code: "some updated country_code",
    country_name: "some updated country_name"
  }
  @invalid_attrs %{country_code: nil, country_name: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all country_lookup", %{conn: conn} do
      conn = get(conn, ~p"/api/country_lookup")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create country_lookup" do
    test "renders country_lookup when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/country_lookup", country_lookup: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/country_lookup/#{id}")

      assert %{
               "id" => ^id,
               "country_code" => "some country_code",
               "country_name" => "some country_name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/country_lookup", country_lookup: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update country_lookup" do
    setup [:create_country_lookup]

    test "renders country_lookup when data is valid", %{conn: conn, country_lookup: %CountryLookup{id: id} = country_lookup} do
      conn = put(conn, ~p"/api/country_lookup/#{country_lookup}", country_lookup: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/country_lookup/#{id}")

      assert %{
               "id" => ^id,
               "country_code" => "some updated country_code",
               "country_name" => "some updated country_name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, country_lookup: country_lookup} do
      conn = put(conn, ~p"/api/country_lookup/#{country_lookup}", country_lookup: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete country_lookup" do
    setup [:create_country_lookup]

    test "deletes chosen country_lookup", %{conn: conn, country_lookup: country_lookup} do
      conn = delete(conn, ~p"/api/country_lookup/#{country_lookup}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/country_lookup/#{country_lookup}")
      end
    end
  end

  defp create_country_lookup(_) do
    country_lookup = country_lookup_fixture()
    %{country_lookup: country_lookup}
  end
end
