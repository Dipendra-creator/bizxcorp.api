defmodule Bizxcorp.UsersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Bizxcorp.Users` context.
  """

  @doc """
  Generate a unique user email.
  """
  def unique_user_email, do: "some email#{System.unique_integer([:positive])}"

  @doc """
  Generate a unique user username.
  """
  def unique_user_username, do: "some username#{System.unique_integer([:positive])}"

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        dob: ~D[2023-09-24],
        email: unique_user_email(),
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
        username: unique_user_username()
      })
      |> Bizxcorp.Users.create_user()

    user
  end

  @doc """
  Generate a authsession.
  """
  def authsession_fixture(attrs \\ %{}) do
    {:ok, authsession} =
      attrs
      |> Enum.into(%{
        deleted_at: ~U[2023-09-24 15:20:00Z],
        last_used_at: ~U[2023-09-24 15:20:00Z],
        token: "some token",
        user_agent: "some user_agent",
        user_device: "some user_device",
        user_ip: "some user_ip"
      })
      |> Bizxcorp.Users.create_authsession()

    authsession
  end
end
