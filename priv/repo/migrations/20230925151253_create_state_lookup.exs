defmodule Bizxcorp.Repo.Migrations.CreateStateLookup do
  use Ecto.Migration

  def change do
    create table(:state_lookup) do
      add :state_name, :string
      add :state_code, :string
      add :country_id, references(:country_lookup, on_delete: :nothing)

      timestamps()
    end

    create index(:state_lookup, [:country_id])
  end
end
