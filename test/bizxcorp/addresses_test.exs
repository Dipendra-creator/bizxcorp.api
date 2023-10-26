defmodule Bizxcorp.AddressesTest do
  use Bizxcorp.DataCase

  alias Bizxcorp.Addresses

  describe "country_lookup" do
    alias Bizxcorp.Addresses.CountryLookup

    import Bizxcorp.AddressesFixtures

    @invalid_attrs %{country_code: nil, country_name: nil, "timestamps()": nil}

    test "list_country_lookup/0 returns all country_lookup" do
      country_lookup = country_lookup_fixture()
      assert Addresses.list_country_lookup() == [country_lookup]
    end

    test "get_country_lookup!/1 returns the country_lookup with given id" do
      country_lookup = country_lookup_fixture()
      assert Addresses.get_country_lookup!(country_lookup.id) == country_lookup
    end

    test "create_country_lookup/1 with valid data creates a country_lookup" do
      valid_attrs = %{country_code: "some country_code", country_name: "some country_name", "timestamps()": "some timestamps()"}

      assert {:ok, %CountryLookup{} = country_lookup} = Addresses.create_country_lookup(valid_attrs)
      assert country_lookup.country_code == "some country_code"
      assert country_lookup.country_name == "some country_name"
      assert country_lookup.timestamps() == "some timestamps()"
    end

    test "create_country_lookup/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Addresses.create_country_lookup(@invalid_attrs)
    end

    test "update_country_lookup/2 with valid data updates the country_lookup" do
      country_lookup = country_lookup_fixture()
      update_attrs = %{country_code: "some updated country_code", country_name: "some updated country_name", "timestamps()": "some updated timestamps()"}

      assert {:ok, %CountryLookup{} = country_lookup} = Addresses.update_country_lookup(country_lookup, update_attrs)
      assert country_lookup.country_code == "some updated country_code"
      assert country_lookup.country_name == "some updated country_name"
      assert country_lookup.timestamps() == "some updated timestamps()"
    end

    test "update_country_lookup/2 with invalid data returns error changeset" do
      country_lookup = country_lookup_fixture()
      assert {:error, %Ecto.Changeset{}} = Addresses.update_country_lookup(country_lookup, @invalid_attrs)
      assert country_lookup == Addresses.get_country_lookup!(country_lookup.id)
    end

    test "delete_country_lookup/1 deletes the country_lookup" do
      country_lookup = country_lookup_fixture()
      assert {:ok, %CountryLookup{}} = Addresses.delete_country_lookup(country_lookup)
      assert_raise Ecto.NoResultsError, fn -> Addresses.get_country_lookup!(country_lookup.id) end
    end

    test "change_country_lookup/1 returns a country_lookup changeset" do
      country_lookup = country_lookup_fixture()
      assert %Ecto.Changeset{} = Addresses.change_country_lookup(country_lookup)
    end
  end

  describe "country_lookup" do
    alias Bizxcorp.Addresses.CountryLookup

    import Bizxcorp.AddressesFixtures

    @invalid_attrs %{country_code: nil, country_name: nil}

    test "list_country_lookup/0 returns all country_lookup" do
      country_lookup = country_lookup_fixture()
      assert Addresses.list_country_lookup() == [country_lookup]
    end

    test "get_country_lookup!/1 returns the country_lookup with given id" do
      country_lookup = country_lookup_fixture()
      assert Addresses.get_country_lookup!(country_lookup.id) == country_lookup
    end

    test "create_country_lookup/1 with valid data creates a country_lookup" do
      valid_attrs = %{country_code: "some country_code", country_name: "some country_name"}

      assert {:ok, %CountryLookup{} = country_lookup} = Addresses.create_country_lookup(valid_attrs)
      assert country_lookup.country_code == "some country_code"
      assert country_lookup.country_name == "some country_name"
    end

    test "create_country_lookup/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Addresses.create_country_lookup(@invalid_attrs)
    end

    test "update_country_lookup/2 with valid data updates the country_lookup" do
      country_lookup = country_lookup_fixture()
      update_attrs = %{country_code: "some updated country_code", country_name: "some updated country_name"}

      assert {:ok, %CountryLookup{} = country_lookup} = Addresses.update_country_lookup(country_lookup, update_attrs)
      assert country_lookup.country_code == "some updated country_code"
      assert country_lookup.country_name == "some updated country_name"
    end

    test "update_country_lookup/2 with invalid data returns error changeset" do
      country_lookup = country_lookup_fixture()
      assert {:error, %Ecto.Changeset{}} = Addresses.update_country_lookup(country_lookup, @invalid_attrs)
      assert country_lookup == Addresses.get_country_lookup!(country_lookup.id)
    end

    test "delete_country_lookup/1 deletes the country_lookup" do
      country_lookup = country_lookup_fixture()
      assert {:ok, %CountryLookup{}} = Addresses.delete_country_lookup(country_lookup)
      assert_raise Ecto.NoResultsError, fn -> Addresses.get_country_lookup!(country_lookup.id) end
    end

    test "change_country_lookup/1 returns a country_lookup changeset" do
      country_lookup = country_lookup_fixture()
      assert %Ecto.Changeset{} = Addresses.change_country_lookup(country_lookup)
    end
  end

  describe "state_lookup" do
    alias Bizxcorp.Addresses.StateLookup

    import Bizxcorp.AddressesFixtures

    @invalid_attrs %{state_code: nil, state_name: nil}

    test "list_state_lookup/0 returns all state_lookup" do
      state_lookup = state_lookup_fixture()
      assert Addresses.list_state_lookup() == [state_lookup]
    end

    test "get_state_lookup!/1 returns the state_lookup with given id" do
      state_lookup = state_lookup_fixture()
      assert Addresses.get_state_lookup!(state_lookup.id) == state_lookup
    end

    test "create_state_lookup/1 with valid data creates a state_lookup" do
      valid_attrs = %{state_code: "some state_code", state_name: "some state_name"}

      assert {:ok, %StateLookup{} = state_lookup} = Addresses.create_state_lookup(valid_attrs)
      assert state_lookup.state_code == "some state_code"
      assert state_lookup.state_name == "some state_name"
    end

    test "create_state_lookup/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Addresses.create_state_lookup(@invalid_attrs)
    end

    test "update_state_lookup/2 with valid data updates the state_lookup" do
      state_lookup = state_lookup_fixture()
      update_attrs = %{state_code: "some updated state_code", state_name: "some updated state_name"}

      assert {:ok, %StateLookup{} = state_lookup} = Addresses.update_state_lookup(state_lookup, update_attrs)
      assert state_lookup.state_code == "some updated state_code"
      assert state_lookup.state_name == "some updated state_name"
    end

    test "update_state_lookup/2 with invalid data returns error changeset" do
      state_lookup = state_lookup_fixture()
      assert {:error, %Ecto.Changeset{}} = Addresses.update_state_lookup(state_lookup, @invalid_attrs)
      assert state_lookup == Addresses.get_state_lookup!(state_lookup.id)
    end

    test "delete_state_lookup/1 deletes the state_lookup" do
      state_lookup = state_lookup_fixture()
      assert {:ok, %StateLookup{}} = Addresses.delete_state_lookup(state_lookup)
      assert_raise Ecto.NoResultsError, fn -> Addresses.get_state_lookup!(state_lookup.id) end
    end

    test "change_state_lookup/1 returns a state_lookup changeset" do
      state_lookup = state_lookup_fixture()
      assert %Ecto.Changeset{} = Addresses.change_state_lookup(state_lookup)
    end
  end

  describe "city_lookup" do
    alias Bizxcorp.Addresses.CityLookup

    import Bizxcorp.AddressesFixtures

    @invalid_attrs %{city_code: nil, city_name: nil}

    test "list_city_lookup/0 returns all city_lookup" do
      city_lookup = city_lookup_fixture()
      assert Addresses.list_city_lookup() == [city_lookup]
    end

    test "get_city_lookup!/1 returns the city_lookup with given id" do
      city_lookup = city_lookup_fixture()
      assert Addresses.get_city_lookup!(city_lookup.id) == city_lookup
    end

    test "create_city_lookup/1 with valid data creates a city_lookup" do
      valid_attrs = %{city_code: "some city_code", city_name: "some city_name"}

      assert {:ok, %CityLookup{} = city_lookup} = Addresses.create_city_lookup(valid_attrs)
      assert city_lookup.city_code == "some city_code"
      assert city_lookup.city_name == "some city_name"
    end

    test "create_city_lookup/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Addresses.create_city_lookup(@invalid_attrs)
    end

    test "update_city_lookup/2 with valid data updates the city_lookup" do
      city_lookup = city_lookup_fixture()
      update_attrs = %{city_code: "some updated city_code", city_name: "some updated city_name"}

      assert {:ok, %CityLookup{} = city_lookup} = Addresses.update_city_lookup(city_lookup, update_attrs)
      assert city_lookup.city_code == "some updated city_code"
      assert city_lookup.city_name == "some updated city_name"
    end

    test "update_city_lookup/2 with invalid data returns error changeset" do
      city_lookup = city_lookup_fixture()
      assert {:error, %Ecto.Changeset{}} = Addresses.update_city_lookup(city_lookup, @invalid_attrs)
      assert city_lookup == Addresses.get_city_lookup!(city_lookup.id)
    end

    test "delete_city_lookup/1 deletes the city_lookup" do
      city_lookup = city_lookup_fixture()
      assert {:ok, %CityLookup{}} = Addresses.delete_city_lookup(city_lookup)
      assert_raise Ecto.NoResultsError, fn -> Addresses.get_city_lookup!(city_lookup.id) end
    end

    test "change_city_lookup/1 returns a city_lookup changeset" do
      city_lookup = city_lookup_fixture()
      assert %Ecto.Changeset{} = Addresses.change_city_lookup(city_lookup)
    end
  end

  describe "address" do
    alias Bizxcorp.Addresses.Address

    import Bizxcorp.AddressesFixtures

    @invalid_attrs %{pincode: nil}

    test "list_address/0 returns all address" do
      address = address_fixture()
      assert Addresses.list_address() == [address]
    end

    test "get_address!/1 returns the address with given id" do
      address = address_fixture()
      assert Addresses.get_address!(address.id) == address
    end

    test "create_address/1 with valid data creates a address" do
      valid_attrs = %{pincode: "some pincode"}

      assert {:ok, %Address{} = address} = Addresses.create_address(valid_attrs)
      assert address.pincode == "some pincode"
    end

    test "create_address/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Addresses.create_address(@invalid_attrs)
    end

    test "update_address/2 with valid data updates the address" do
      address = address_fixture()
      update_attrs = %{pincode: "some updated pincode"}

      assert {:ok, %Address{} = address} = Addresses.update_address(address, update_attrs)
      assert address.pincode == "some updated pincode"
    end

    test "update_address/2 with invalid data returns error changeset" do
      address = address_fixture()
      assert {:error, %Ecto.Changeset{}} = Addresses.update_address(address, @invalid_attrs)
      assert address == Addresses.get_address!(address.id)
    end

    test "delete_address/1 deletes the address" do
      address = address_fixture()
      assert {:ok, %Address{}} = Addresses.delete_address(address)
      assert_raise Ecto.NoResultsError, fn -> Addresses.get_address!(address.id) end
    end

    test "change_address/1 returns a address changeset" do
      address = address_fixture()
      assert %Ecto.Changeset{} = Addresses.change_address(address)
    end
  end
end
