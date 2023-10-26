defmodule Bizxcorp.Repo.Migrations.CreateStateLookup do
  use Ecto.Migration

  def change do
    create table(:state_lookup) do
      add :state_name, :string
      add :state_code, :string

      timestamps()
    end
  end
end
