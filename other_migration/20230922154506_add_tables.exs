defmodule Bizxcorp.Repo.Migrations.AddTables do
  use Ecto.Migration

  def change do
    create table(:country_lookup) do
      add :country_name, :string
      add :country_code, :string
      timestamps()
    end

    # mix phx.gen.json Addresses CountryLookup country_lookup country_name:string country_code:string

    create table(:state_lookup) do
      add :state_name, :string
      add :state_code, :string
      timestamps()
    end

    alter table(:state_lookup) do
      add :country, references(:country_lookup, on_delete: :delete_all)
    end

    # mix phx.gen.json Addresses StateLookup state_lookup state_name:string state_code:string country_id:references:country_lookup

    create table(:city_lookup) do
      add :city_code, :string
      add :city_name, :string
      timestamps()
    end

    alter table(:city_lookup) do
      add :state, references(:state_lookup, on_delete: :delete_all)
      add :country, references(:country_lookup, on_delete: :delete_all)
    end

    # mix phx.gen.json Addresses CityLookup city_lookup city_code:string city_name:string state_id:references:state_lookup country_id:references:country_lookup

    create table(:address) do
      add :pincode, :string
      timestamps()
    end

    alter table(:address) do
      add :city, references(:city_lookup, on_delete: :delete_all)
      add :state, references(:state_lookup, on_delete: :delete_all)
      add :country, references(:country_lookup, on_delete: :delete_all)
    end

    # mix phx.gen.json Addresses Address address pincode:string city_id:references:city_lookup state_id:references:state_lookup country_id:references:country_lookup

    create table(:organization_type) do
      add :name, :string
      add :description, :string
      timestamps()
    end

    # mix phx.gen.json Organizations OrganizationType organization_type name:string description:string

    create table(:organization) do
      add :name, :string
      add :number_of_employees, :integer
      add :description, :string
      add :tag, :string
      timestamps()
    end

    alter table(:organization) do
      add :type, references(:organization_type, on_delete: :delete_all)
      add :address, references(:address, on_delete: :delete_all)
    end

    # mix phx.gen.json Organizations Organization organization name:string number_of_employees:integer description:string tag:string type_id:references:organization_type address_id:references:address

    create table(:user) do
      add :name, :string
      add :dob, :date
      add :email, :string, unique: true
      add :username, :string, unique: true
      add :password, :string
      add :phone, :string
      add :role, :string
      add :status, :string
      add :experience, :integer
      add :organization_join_date, :date
      add :salary, :integer
      add :number_of_posts, :integer
      add :last_seen, :date
      timestamps()
    end

    alter table(:user) do
      add :address, references(:address, on_delete: :delete_all)
      add :organization, references(:organization, on_delete: :delete_all)
    end

    # mix phx.gen.json Users User user name:string dob:date email:string:unique username:string:unique password:string phone:string role:string status:string experience:integer organization_join_date:date salary:integer number_of_posts:integer last_seen:date address_id:references:address organization_id:references:organization

    create table(:authsession) do
      add :token, :string
      add :user_device, :string
      add :user_ip, :string
      add :user_agent, :string
      add :last_used_at, :utc_datetime
      add :deleted_at, :utc_datetime
      timestamps()
    end

    alter table(:authsession) do
      add :user, references(:user, on_delete: :delete_all)
    end

    # mix phx.gen.json Users Authsession authsession token:string user_device:string user_ip:string user_agent:string last_used_at:utc_datetime deleted_at:utc_datetime user_id:references:user
  end
end
