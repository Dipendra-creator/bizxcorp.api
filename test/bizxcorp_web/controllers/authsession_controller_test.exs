defmodule BizxcorpWeb.AuthsessionControllerTest do
  use BizxcorpWeb.ConnCase

  import Bizxcorp.UsersFixtures

  alias Bizxcorp.Users.Authsession

  @create_attrs %{
    deleted_at: ~U[2023-09-24 15:20:00Z],
    last_used_at: ~U[2023-09-24 15:20:00Z],
    token: "some token",
    user_agent: "some user_agent",
    user_device: "some user_device",
    user_ip: "some user_ip"
  }
  @update_attrs %{
    deleted_at: ~U[2023-09-25 15:20:00Z],
    last_used_at: ~U[2023-09-25 15:20:00Z],
    token: "some updated token",
    user_agent: "some updated user_agent",
    user_device: "some updated user_device",
    user_ip: "some updated user_ip"
  }
  @invalid_attrs %{deleted_at: nil, last_used_at: nil, token: nil, user_agent: nil, user_device: nil, user_ip: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all authsession", %{conn: conn} do
      conn = get(conn, ~p"/api/authsession")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create authsession" do
    test "renders authsession when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/authsession", authsession: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/authsession/#{id}")

      assert %{
               "id" => ^id,
               "deleted_at" => "2023-09-24T15:20:00Z",
               "last_used_at" => "2023-09-24T15:20:00Z",
               "token" => "some token",
               "user_agent" => "some user_agent",
               "user_device" => "some user_device",
               "user_ip" => "some user_ip"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/authsession", authsession: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update authsession" do
    setup [:create_authsession]

    test "renders authsession when data is valid", %{conn: conn, authsession: %Authsession{id: id} = authsession} do
      conn = put(conn, ~p"/api/authsession/#{authsession}", authsession: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/authsession/#{id}")

      assert %{
               "id" => ^id,
               "deleted_at" => "2023-09-25T15:20:00Z",
               "last_used_at" => "2023-09-25T15:20:00Z",
               "token" => "some updated token",
               "user_agent" => "some updated user_agent",
               "user_device" => "some updated user_device",
               "user_ip" => "some updated user_ip"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, authsession: authsession} do
      conn = put(conn, ~p"/api/authsession/#{authsession}", authsession: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete authsession" do
    setup [:create_authsession]

    test "deletes chosen authsession", %{conn: conn, authsession: authsession} do
      conn = delete(conn, ~p"/api/authsession/#{authsession}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/authsession/#{authsession}")
      end
    end
  end

  defp create_authsession(_) do
    authsession = authsession_fixture()
    %{authsession: authsession}
  end
end
