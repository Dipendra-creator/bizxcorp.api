defmodule Bizxcorp.Organizations.Organization do
  use Ecto.Schema
  import Ecto.Changeset

  schema "organization" do
    field :description, :string
    field :name, :string
    field :number_of_employees, :integer
    field :tag, :string
    field :type_id, :id
    field :address_id, :id

    timestamps()
  end

  @doc false
  def changeset(organization, attrs) do
    organization
    |> cast(attrs, [:name, :number_of_employees, :description, :tag])
    |> validate_required([:name, :number_of_employees, :description, :tag])
  end
end
