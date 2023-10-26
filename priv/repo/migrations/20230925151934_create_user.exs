defmodule Bizxcorp.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:user) do
      add :name, :string
      add :dob, :date
      add :email, :string
      add :username, :string
      add :password, :string
      add :phone, :string
      add :role, :string
      add :status, :string
      add :experience, :integer
      add :organization_join_date, :date
      add :salary, :integer
      add :number_of_posts, :integer
      add :last_seen, :date
      add :address_id, references(:address, on_delete: :nothing)
      add :organization_id, references(:organization, on_delete: :nothing)

      timestamps()
    end

    create unique_index(:user, [:username])
    create unique_index(:user, [:email])
    create index(:user, [:address_id])
    create index(:user, [:organization_id])
  end
end
