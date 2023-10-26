defmodule Bizxcorp.Repo.Migrations.CreateOrganization do
  use Ecto.Migration

  def change do
    create table(:organization) do
      add :name, :string
      add :number_of_employees, :integer
      add :description, :string
      add :tag, :string
      add :type_id, references(:organization_type, on_delete: :nothing)
      add :address_id, references(:address, on_delete: :nothing)

      timestamps()
    end

    create index(:organization, [:type_id])
    create index(:organization, [:address_id])
  end
end
