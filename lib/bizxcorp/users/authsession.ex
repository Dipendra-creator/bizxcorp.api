defmodule Bizxcorp.Users.Authsession do
  use Ecto.Schema
  import Ecto.Changeset

  schema "authsession" do
    field :deleted_at, :utc_datetime
    field :last_used_at, :utc_datetime
    field :token, :string
    field :user_agent, :string
    field :user_device, :string
    field :user_ip, :string
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(authsession, attrs) do
    authsession
    |> cast(attrs, [:token, :user_device, :user_ip, :user_agent, :last_used_at, :deleted_at])
    |> validate_required([:token, :user_device, :user_ip, :user_agent, :last_used_at, :deleted_at])
  end
end
