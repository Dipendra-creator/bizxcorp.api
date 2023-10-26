defmodule Bizxcorp.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "user" do
    field :dob, :date
    field :email, :string
    field :experience, :integer
    field :last_seen, :date
    field :name, :string
    field :number_of_posts, :integer
    field :organization_join_date, :date
    field :password, :string
    field :phone, :string
    field :role, :string
    field :salary, :integer
    field :status, :string
    field :username, :string
    field :address_id, :id
    field :organization_id, :id

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :dob, :email, :username, :password, :phone, :role, :status, :experience, :organization_join_date, :salary, :number_of_posts, :last_seen])
    |> validate_required([:name, :email, :username, :password])
    |> unique_constraint(:username)
    |> unique_constraint(:email)
    |> put_password_hash
  end

  defp put_password_hash(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, password: Pbkdf2.hash_pwd_salt(password))
  end

  defp put_password_hash(changeset), do: changeset

end

