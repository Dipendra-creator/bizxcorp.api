defmodule Bizxcorp.Repo.Migrations.CreateAddress do
  use Ecto.Migration

  def change do
    create table(:address) do
      add :pincode, :string
      add :city_id, references(:city_lookup, on_delete: :nothing)
      add :state_id, references(:state_lookup, on_delete: :nothing)
      add :country_id, references(:country_lookup, on_delete: :nothing)

      timestamps()
    end

    create index(:address, [:city_id])
    create index(:address, [:state_id])
    create index(:address, [:country_id])
  end
end
