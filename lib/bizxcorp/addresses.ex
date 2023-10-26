defmodule Bizxcorp.Addresses do
  @moduledoc """
  The Addresses context.
  """

  import Ecto.Query, warn: false
  alias Bizxcorp.Repo

  alias Bizxcorp.Addresses.CountryLookup

  @doc """
  Returns the list of country_lookup.

  ## Examples

      iex> list_country_lookup()
      [%CountryLookup{}, ...]

  """
  def list_country_lookup do
    Repo.all(CountryLookup)
  end

  @doc """
  Gets a single country_lookup.

  Raises `Ecto.NoResultsError` if the Country lookup does not exist.

  ## Examples

      iex> get_country_lookup!(123)
      %CountryLookup{}

      iex> get_country_lookup!(456)
      ** (Ecto.NoResultsError)

  """
  def get_country_lookup!(id), do: Repo.get!(CountryLookup, id)

  @doc """
  Creates a country_lookup.

  ## Examples

      iex> create_country_lookup(%{field: value})
      {:ok, %CountryLookup{}}

      iex> create_country_lookup(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_country_lookup(attrs \\ %{}) do
    %CountryLookup{}
    |> CountryLookup.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a country_lookup.

  ## Examples

      iex> update_country_lookup(country_lookup, %{field: new_value})
      {:ok, %CountryLookup{}}

      iex> update_country_lookup(country_lookup, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_country_lookup(%CountryLookup{} = country_lookup, attrs) do
    country_lookup
    |> CountryLookup.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a country_lookup.

  ## Examples

      iex> delete_country_lookup(country_lookup)
      {:ok, %CountryLookup{}}

      iex> delete_country_lookup(country_lookup)
      {:error, %Ecto.Changeset{}}

  """
  def delete_country_lookup(%CountryLookup{} = country_lookup) do
    Repo.delete(country_lookup)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking country_lookup changes.

  ## Examples

      iex> change_country_lookup(country_lookup)
      %Ecto.Changeset{data: %CountryLookup{}}

  """
  def change_country_lookup(%CountryLookup{} = country_lookup, attrs \\ %{}) do
    CountryLookup.changeset(country_lookup, attrs)
  end

  alias Bizxcorp.Addresses.StateLookup

  @doc """
  Returns the list of state_lookup.

  ## Examples

      iex> list_state_lookup()
      [%StateLookup{}, ...]

  """
  def list_state_lookup do
    Repo.all(StateLookup)
  end

  @doc """
  Gets a single state_lookup.

  Raises `Ecto.NoResultsError` if the State lookup does not exist.

  ## Examples

      iex> get_state_lookup!(123)
      %StateLookup{}

      iex> get_state_lookup!(456)
      ** (Ecto.NoResultsError)

  """
  def get_state_lookup!(id), do: Repo.get!(StateLookup, id)

  @doc """
  Creates a state_lookup.

  ## Examples

      iex> create_state_lookup(%{field: value})
      {:ok, %StateLookup{}}

      iex> create_state_lookup(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_state_lookup(attrs \\ %{}) do
    %StateLookup{}
    |> StateLookup.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a state_lookup.

  ## Examples

      iex> update_state_lookup(state_lookup, %{field: new_value})
      {:ok, %StateLookup{}}

      iex> update_state_lookup(state_lookup, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_state_lookup(%StateLookup{} = state_lookup, attrs) do
    state_lookup
    |> StateLookup.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a state_lookup.

  ## Examples

      iex> delete_state_lookup(state_lookup)
      {:ok, %StateLookup{}}

      iex> delete_state_lookup(state_lookup)
      {:error, %Ecto.Changeset{}}

  """
  def delete_state_lookup(%StateLookup{} = state_lookup) do
    Repo.delete(state_lookup)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking state_lookup changes.

  ## Examples

      iex> change_state_lookup(state_lookup)
      %Ecto.Changeset{data: %StateLookup{}}

  """
  def change_state_lookup(%StateLookup{} = state_lookup, attrs \\ %{}) do
    StateLookup.changeset(state_lookup, attrs)
  end

  alias Bizxcorp.Addresses.CityLookup

  @doc """
  Returns the list of city_lookup.

  ## Examples

      iex> list_city_lookup()
      [%CityLookup{}, ...]

  """
  def list_city_lookup do
    Repo.all(CityLookup)
  end

  @doc """
  Gets a single city_lookup.

  Raises `Ecto.NoResultsError` if the City lookup does not exist.

  ## Examples

      iex> get_city_lookup!(123)
      %CityLookup{}

      iex> get_city_lookup!(456)
      ** (Ecto.NoResultsError)

  """
  def get_city_lookup!(id), do: Repo.get!(CityLookup, id)

  @doc """
  Creates a city_lookup.

  ## Examples

      iex> create_city_lookup(%{field: value})
      {:ok, %CityLookup{}}

      iex> create_city_lookup(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_city_lookup(attrs \\ %{}) do
    %CityLookup{}
    |> CityLookup.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a city_lookup.

  ## Examples

      iex> update_city_lookup(city_lookup, %{field: new_value})
      {:ok, %CityLookup{}}

      iex> update_city_lookup(city_lookup, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_city_lookup(%CityLookup{} = city_lookup, attrs) do
    city_lookup
    |> CityLookup.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a city_lookup.

  ## Examples

      iex> delete_city_lookup(city_lookup)
      {:ok, %CityLookup{}}

      iex> delete_city_lookup(city_lookup)
      {:error, %Ecto.Changeset{}}

  """
  def delete_city_lookup(%CityLookup{} = city_lookup) do
    Repo.delete(city_lookup)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking city_lookup changes.

  ## Examples

      iex> change_city_lookup(city_lookup)
      %Ecto.Changeset{data: %CityLookup{}}

  """
  def change_city_lookup(%CityLookup{} = city_lookup, attrs \\ %{}) do
    CityLookup.changeset(city_lookup, attrs)
  end

  alias Bizxcorp.Addresses.Address

  @doc """
  Returns the list of address.

  ## Examples

      iex> list_address()
      [%Address{}, ...]

  """
  def list_address do
    Repo.all(Address)
  end

  @doc """
  Gets a single address.

  Raises `Ecto.NoResultsError` if the Address does not exist.

  ## Examples

      iex> get_address!(123)
      %Address{}

      iex> get_address!(456)
      ** (Ecto.NoResultsError)

  """
  def get_address!(id), do: Repo.get!(Address, id)

  @doc """
  Creates a address.

  ## Examples

      iex> create_address(%{field: value})
      {:ok, %Address{}}

      iex> create_address(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_address(attrs \\ %{}) do
    %Address{}
    |> Address.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a address.

  ## Examples

      iex> update_address(address, %{field: new_value})
      {:ok, %Address{}}

      iex> update_address(address, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_address(%Address{} = address, attrs) do
    address
    |> Address.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a address.

  ## Examples

      iex> delete_address(address)
      {:ok, %Address{}}

      iex> delete_address(address)
      {:error, %Ecto.Changeset{}}

  """
  def delete_address(%Address{} = address) do
    Repo.delete(address)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking address changes.

  ## Examples

      iex> change_address(address)
      %Ecto.Changeset{data: %Address{}}

  """
  def change_address(%Address{} = address, attrs \\ %{}) do
    Address.changeset(address, attrs)
  end
end
