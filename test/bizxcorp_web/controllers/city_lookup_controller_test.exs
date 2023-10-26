defmodule BizxcorpWeb.CityLookupControllerTest do
  use BizxcorpWeb.ConnCase

  import Bizxcorp.AddressesFixtures

  alias Bizxcorp.Addresses.CityLookup

  @create_attrs %{
    city_code: "some city_code",
    city_name: "some city_name"
  }
  @update_attrs %{
    city_code: "some updated city_code",
    city_name: "some updated city_name"
  }
  @invalid_attrs %{city_code: nil, city_name: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all city_lookup", %{conn: conn} do
      conn = get(conn, ~p"/api/city_lookup")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create city_lookup" do
    test "renders city_lookup when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/city_lookup", city_lookup: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/city_lookup/#{id}")

      assert %{
               "id" => ^id,
               "city_code" => "some city_code",
               "city_name" => "some city_name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/city_lookup", city_lookup: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update city_lookup" do
    setup [:create_city_lookup]

    test "renders city_lookup when data is valid", %{conn: conn, city_lookup: %CityLookup{id: id} = city_lookup} do
      conn = put(conn, ~p"/api/city_lookup/#{city_lookup}", city_lookup: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/city_lookup/#{id}")

      assert %{
               "id" => ^id,
               "city_code" => "some updated city_code",
               "city_name" => "some updated city_name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, city_lookup: city_lookup} do
      conn = put(conn, ~p"/api/city_lookup/#{city_lookup}", city_lookup: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete city_lookup" do
    setup [:create_city_lookup]

    test "deletes chosen city_lookup", %{conn: conn, city_lookup: city_lookup} do
      conn = delete(conn, ~p"/api/city_lookup/#{city_lookup}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/city_lookup/#{city_lookup}")
      end
    end
  end

  defp create_city_lookup(_) do
    city_lookup = city_lookup_fixture()
    %{city_lookup: city_lookup}
  end
end
