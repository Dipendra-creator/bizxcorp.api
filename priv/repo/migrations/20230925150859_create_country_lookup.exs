defmodule Bizxcorp.Repo.Migrations.CreateCountryLookup do
  use Ecto.Migration

  def change do
    create table(:country_lookup) do
      add :country_name, :string
      add :country_code, :string

      timestamps()
    end
  end
end
