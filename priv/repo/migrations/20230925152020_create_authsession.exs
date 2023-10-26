defmodule Bizxcorp.Repo.Migrations.CreateAuthsession do
  use Ecto.Migration

  def change do
    create table(:authsession) do
      add :token, :string
      add :user_device, :string
      add :user_ip, :string
      add :user_agent, :string
      add :last_used_at, :utc_datetime
      add :deleted_at, :utc_datetime
      add :user_id, references(:user, on_delete: :nothing)

      timestamps()
    end

    create index(:authsession, [:user_id])
  end
end
