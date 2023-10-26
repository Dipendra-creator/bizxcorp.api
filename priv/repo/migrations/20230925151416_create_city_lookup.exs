defmodule Bizxcorp.Repo.Migrations.CreateCityLookup do
  use Ecto.Migration

  def change do
    create table(:city_lookup) do
      add :city_code, :string
      add :city_name, :string
      add :state_id, references(:state_lookup, on_delete: :nothing)
      add :country_id, references(:country_lookup, on_delete: :nothing)

      timestamps()
    end

    create index(:city_lookup, [:state_id])
    create index(:city_lookup, [:country_id])
  end
end
