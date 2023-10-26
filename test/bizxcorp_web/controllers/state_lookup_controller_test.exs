defmodule BizxcorpWeb.StateLookupControllerTest do
  use BizxcorpWeb.ConnCase

  import Bizxcorp.AddressesFixtures

  alias Bizxcorp.Addresses.StateLookup

  @create_attrs %{
    state_code: "some state_code",
    state_name: "some state_name"
  }
  @update_attrs %{
    state_code: "some updated state_code",
    state_name: "some updated state_name"
  }
  @invalid_attrs %{state_code: nil, state_name: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all state_lookup", %{conn: conn} do
      conn = get(conn, ~p"/api/state_lookup")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create state_lookup" do
    test "renders state_lookup when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/state_lookup", state_lookup: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/state_lookup/#{id}")

      assert %{
               "id" => ^id,
               "state_code" => "some state_code",
               "state_name" => "some state_name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/state_lookup", state_lookup: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update state_lookup" do
    setup [:create_state_lookup]

    test "renders state_lookup when data is valid", %{conn: conn, state_lookup: %StateLookup{id: id} = state_lookup} do
      conn = put(conn, ~p"/api/state_lookup/#{state_lookup}", state_lookup: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/state_lookup/#{id}")

      assert %{
               "id" => ^id,
               "state_code" => "some updated state_code",
               "state_name" => "some updated state_name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, state_lookup: state_lookup} do
      conn = put(conn, ~p"/api/state_lookup/#{state_lookup}", state_lookup: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete state_lookup" do
    setup [:create_state_lookup]

    test "deletes chosen state_lookup", %{conn: conn, state_lookup: state_lookup} do
      conn = delete(conn, ~p"/api/state_lookup/#{state_lookup}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/state_lookup/#{state_lookup}")
      end
    end
  end

  defp create_state_lookup(_) do
    state_lookup = state_lookup_fixture()
    %{state_lookup: state_lookup}
  end
end
