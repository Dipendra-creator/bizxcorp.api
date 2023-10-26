defmodule Bizxcorp.Users do
  @moduledoc """
  The Users context.
  """

  import Ecto.Query, warn: false
  alias Bizxcorp.Repo

  alias Bizxcorp.Users.User

  @doc """
  Returns the list of user.

  ## Examples

      iex> list_user()
      [%User{}, ...]

  """
  def list_user do
    Repo.all(User)
  end

  @doc """
  Gets a single user.

  Raises `Ecto.NoResultsError` if the User does not exist.

  ## Examples

      iex> get_user!(123)
      %User{}

      iex> get_user!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user!(id), do: Repo.get!(User, id)

  @doc """
  Gets a single user.any()

  Returns `nil` if the User does not exist.

  ## Examples

      iex> get_user_by_username("Robin")
      %User{}

      iex> get_user_by_username("dipendra")
      nil

  """
  def get_user_by_username(username) do
    Repo.get_by(User, username: username)
  end

  @doc """
  Gets a single user.any()

  Returns `nil` if the User does not exist.

  ## Examples

      iex> get_user_by_email("robin@bizxcorp.com")
      %User{}

      iex> get_user_by_email("dipendra@bizxcorp.com")
      nil
  """

  def get_user_by_email(email) do
    Repo.get_by(User, email: email)
  end

  @doc """
  Creates a user.

  ## Examples

      iex> create_user(%{field: value})
      {:ok, %User{}}

      iex> create_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user.

  ## Examples

      iex> update_user(user, %{field: new_value})
      {:ok, %User{}}

      iex> update_user(user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a user.

  ## Examples

      iex> delete_user(user)
      {:ok, %User{}}

      iex> delete_user(user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user changes.

  ## Examples

      iex> change_user(user)
      %Ecto.Changeset{data: %User{}}

  """
  def change_user(%User{} = user, attrs \\ %{}) do
    User.changeset(user, attrs)
  end

  alias Bizxcorp.Users.Authsession

  @doc """
  Returns the list of authsession.

  ## Examples

      iex> list_authsession()
      [%Authsession{}, ...]

  """
  def list_authsession do
    Repo.all(Authsession)
  end

  @doc """
  Gets a single authsession.

  Raises `Ecto.NoResultsError` if the Authsession does not exist.

  ## Examples

      iex> get_authsession!(123)
      %Authsession{}

      iex> get_authsession!(456)
      ** (Ecto.NoResultsError)

  """
  def get_authsession!(id), do: Repo.get!(Authsession, id)

  @doc """
  Creates a authsession.

  ## Examples

      iex> create_authsession(%{field: value})
      {:ok, %Authsession{}}

      iex> create_authsession(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_authsession(attrs \\ %{}) do
    %Authsession{}
    |> Authsession.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a authsession.

  ## Examples

      iex> update_authsession(authsession, %{field: new_value})
      {:ok, %Authsession{}}

      iex> update_authsession(authsession, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_authsession(%Authsession{} = authsession, attrs) do
    authsession
    |> Authsession.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a authsession.

  ## Examples

      iex> delete_authsession(authsession)
      {:ok, %Authsession{}}

      iex> delete_authsession(authsession)
      {:error, %Ecto.Changeset{}}

  """
  def delete_authsession(%Authsession{} = authsession) do
    Repo.delete(authsession)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking authsession changes.

  ## Examples

      iex> change_authsession(authsession)
      %Ecto.Changeset{data: %Authsession{}}

  """
  def change_authsession(%Authsession{} = authsession, attrs \\ %{}) do
    Authsession.changeset(authsession, attrs)
  end
end
