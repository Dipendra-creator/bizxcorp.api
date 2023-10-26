defmodule BizxcorpWeb.AddressJSON do
  alias Bizxcorp.Addresses.Address

  @doc """
  Renders a list of address.
  """
  def index(%{address: address}) do
    %{data: for(address <- address, do: data(address))}
  end

  @doc """
  Renders a single address.
  """
  def show(%{address: address}) do
    %{data: data(address)}
  end

  defp data(%Address{} = address) do
    %{
      id: address.id,
      pincode: address.pincode
    }
  end
end
