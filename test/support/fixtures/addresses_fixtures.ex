defmodule Bizxcorp.AddressesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Bizxcorp.Addresses` context.
  """
  
  @doc """
  Generate a country_lookup.
  """
  def country_lookup_fixture(attrs \\ %{}) do
    {:ok, country_lookup} =
      attrs
      |> Enum.into(%{
        country_code: "some country_code",
        country_name: "some country_name"
      })
      |> Bizxcorp.Addresses.create_country_lookup()

    country_lookup
  end

  @doc """
  Generate a state_lookup.
  """
  def state_lookup_fixture(attrs \\ %{}) do
    {:ok, state_lookup} =
      attrs
      |> Enum.into(%{
        state_code: "some state_code",
        state_name: "some state_name"
      })
      |> Bizxcorp.Addresses.create_state_lookup()

    state_lookup
  end

  @doc """
  Generate a city_lookup.
  """
  def city_lookup_fixture(attrs \\ %{}) do
    {:ok, city_lookup} =
      attrs
      |> Enum.into(%{
        city_code: "some city_code",
        city_name: "some city_name"
      })
      |> Bizxcorp.Addresses.create_city_lookup()

    city_lookup
  end

  @doc """
  Generate a address.
  """
  def address_fixture(attrs \\ %{}) do
    {:ok, address} =
      attrs
      |> Enum.into(%{
        pincode: "some pincode"
      })
      |> Bizxcorp.Addresses.create_address()

    address
  end
end
