defmodule BizxcorpWeb.UserControllerTest do
  use BizxcorpWeb.ConnCase

  import Bizxcorp.UsersFixtures

  alias Bizxcorp.Users.User

  @create_attrs %{
    dob: ~D[2023-09-24],
    email: "some email",
    experience: 42,
    last_seen: ~D[2023-09-24],
    name: "some name",
    number_of_posts: 42,
    organization_join_date: ~D[2023-09-24],
    password: "some password",
    phone: "some phone",
    role: "some role",
    salary: 42,
    status: "some status",
    username: "some username"
  }
  @update_attrs %{
    dob: ~D[2023-09-25],
    email: "some updated email",
    experience: 43,
    last_seen: ~D[2023-09-25],
    name: "some updated name",
    number_of_posts: 43,
    organization_join_date: ~D[2023-09-25],
    password: "some updated password",
    phone: "some updated phone",
    role: "some updated role",
    salary: 43,
    status: "some updated status",
    username: "some updated username"
  }
  @invalid_attrs %{dob: nil, email: nil, experience: nil, last_seen: nil, name: nil, number_of_posts: nil, organization_join_date: nil, password: nil, phone: nil, role: nil, salary: nil, status: nil, username: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all user", %{conn: conn} do
      conn = get(conn, ~p"/api/user")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create user" do
    test "renders user when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/user", user: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/user/#{id}")

      assert %{
               "id" => ^id,
               "dob" => "2023-09-24",
               "email" => "some email",
               "experience" => 42,
               "last_seen" => "2023-09-24",
               "name" => "some name",
               "number_of_posts" => 42,
               "organization_join_date" => "2023-09-24",
               "password" => "some password",
               "phone" => "some phone",
               "role" => "some role",
               "salary" => 42,
               "status" => "some status",
               "username" => "some username"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/user", user: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update user" do
    setup [:create_user]

    test "renders user when data is valid", %{conn: conn, user: %User{id: id} = user} do
      conn = put(conn, ~p"/api/user/#{user}", user: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/user/#{id}")

      assert %{
               "id" => ^id,
               "dob" => "2023-09-25",
               "email" => "some updated email",
               "experience" => 43,
               "last_seen" => "2023-09-25",
               "name" => "some updated name",
               "number_of_posts" => 43,
               "organization_join_date" => "2023-09-25",
               "password" => "some updated password",
               "phone" => "some updated phone",
               "role" => "some updated role",
               "salary" => 43,
               "status" => "some updated status",
               "username" => "some updated username"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, user: user} do
      conn = put(conn, ~p"/api/user/#{user}", user: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete user" do
    setup [:create_user]

    test "deletes chosen user", %{conn: conn, user: user} do
      conn = delete(conn, ~p"/api/user/#{user}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/user/#{user}")
      end
    end
  end

  defp create_user(_) do
    user = user_fixture()
    %{user: user}
  end
end
