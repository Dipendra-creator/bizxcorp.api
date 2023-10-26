defmodule Bizxcorp.UsersTest do
  use Bizxcorp.DataCase

  alias Bizxcorp.Users

  describe "user" do
    alias Bizxcorp.Users.User

    import Bizxcorp.UsersFixtures

    @invalid_attrs %{dob: nil, email: nil, experience: nil, last_seen: nil, name: nil, number_of_posts: nil, organization_join_date: nil, password: nil, phone: nil, role: nil, salary: nil, status: nil, username: nil}

    test "list_user/0 returns all user" do
      user = user_fixture()
      assert Users.list_user() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Users.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      valid_attrs = %{dob: ~D[2023-09-24], email: "some email", experience: 42, last_seen: ~D[2023-09-24], name: "some name", number_of_posts: 42, organization_join_date: ~D[2023-09-24], password: "some password", phone: "some phone", role: "some role", salary: 42, status: "some status", username: "some username"}

      assert {:ok, %User{} = user} = Users.create_user(valid_attrs)
      assert user.dob == ~D[2023-09-24]
      assert user.email == "some email"
      assert user.experience == 42
      assert user.last_seen == ~D[2023-09-24]
      assert user.name == "some name"
      assert user.number_of_posts == 42
      assert user.organization_join_date == ~D[2023-09-24]
      assert user.password == "some password"
      assert user.phone == "some phone"
      assert user.role == "some role"
      assert user.salary == 42
      assert user.status == "some status"
      assert user.username == "some username"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Users.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      update_attrs = %{dob: ~D[2023-09-25], email: "some updated email", experience: 43, last_seen: ~D[2023-09-25], name: "some updated name", number_of_posts: 43, organization_join_date: ~D[2023-09-25], password: "some updated password", phone: "some updated phone", role: "some updated role", salary: 43, status: "some updated status", username: "some updated username"}

      assert {:ok, %User{} = user} = Users.update_user(user, update_attrs)
      assert user.dob == ~D[2023-09-25]
      assert user.email == "some updated email"
      assert user.experience == 43
      assert user.last_seen == ~D[2023-09-25]
      assert user.name == "some updated name"
      assert user.number_of_posts == 43
      assert user.organization_join_date == ~D[2023-09-25]
      assert user.password == "some updated password"
      assert user.phone == "some updated phone"
      assert user.role == "some updated role"
      assert user.salary == 43
      assert user.status == "some updated status"
      assert user.username == "some updated username"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Users.update_user(user, @invalid_attrs)
      assert user == Users.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Users.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Users.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Users.change_user(user)
    end
  end

  describe "authsession" do
    alias Bizxcorp.Users.Authsession

    import Bizxcorp.UsersFixtures

    @invalid_attrs %{deleted_at: nil, last_used_at: nil, token: nil, user_agent: nil, user_device: nil, user_ip: nil}

    test "list_authsession/0 returns all authsession" do
      authsession = authsession_fixture()
      assert Users.list_authsession() == [authsession]
    end

    test "get_authsession!/1 returns the authsession with given id" do
      authsession = authsession_fixture()
      assert Users.get_authsession!(authsession.id) == authsession
    end

    test "create_authsession/1 with valid data creates a authsession" do
      valid_attrs = %{deleted_at: ~U[2023-09-24 15:20:00Z], last_used_at: ~U[2023-09-24 15:20:00Z], token: "some token", user_agent: "some user_agent", user_device: "some user_device", user_ip: "some user_ip"}

      assert {:ok, %Authsession{} = authsession} = Users.create_authsession(valid_attrs)
      assert authsession.deleted_at == ~U[2023-09-24 15:20:00Z]
      assert authsession.last_used_at == ~U[2023-09-24 15:20:00Z]
      assert authsession.token == "some token"
      assert authsession.user_agent == "some user_agent"
      assert authsession.user_device == "some user_device"
      assert authsession.user_ip == "some user_ip"
    end

    test "create_authsession/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Users.create_authsession(@invalid_attrs)
    end

    test "update_authsession/2 with valid data updates the authsession" do
      authsession = authsession_fixture()
      update_attrs = %{deleted_at: ~U[2023-09-25 15:20:00Z], last_used_at: ~U[2023-09-25 15:20:00Z], token: "some updated token", user_agent: "some updated user_agent", user_device: "some updated user_device", user_ip: "some updated user_ip"}

      assert {:ok, %Authsession{} = authsession} = Users.update_authsession(authsession, update_attrs)
      assert authsession.deleted_at == ~U[2023-09-25 15:20:00Z]
      assert authsession.last_used_at == ~U[2023-09-25 15:20:00Z]
      assert authsession.token == "some updated token"
      assert authsession.user_agent == "some updated user_agent"
      assert authsession.user_device == "some updated user_device"
      assert authsession.user_ip == "some updated user_ip"
    end

    test "update_authsession/2 with invalid data returns error changeset" do
      authsession = authsession_fixture()
      assert {:error, %Ecto.Changeset{}} = Users.update_authsession(authsession, @invalid_attrs)
      assert authsession == Users.get_authsession!(authsession.id)
    end

    test "delete_authsession/1 deletes the authsession" do
      authsession = authsession_fixture()
      assert {:ok, %Authsession{}} = Users.delete_authsession(authsession)
      assert_raise Ecto.NoResultsError, fn -> Users.get_authsession!(authsession.id) end
    end

    test "change_authsession/1 returns a authsession changeset" do
      authsession = authsession_fixture()
      assert %Ecto.Changeset{} = Users.change_authsession(authsession)
    end
  end
end
