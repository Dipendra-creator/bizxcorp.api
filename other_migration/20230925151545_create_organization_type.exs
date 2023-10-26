defmodule Bizxcorp.Repo.Migrations.CreateOrganizationType do
  use Ecto.Migration

  def change do
    create table(:organization_type) do
      add :name, :string
      add :description, :string

      timestamps()
    end
  end
end
