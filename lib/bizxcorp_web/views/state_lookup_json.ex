defmodule BizxcorpWeb.StateLookupJSON do
  alias Bizxcorp.Addresses.StateLookup

  @doc """
  Renders a list of state_lookup.
  """
  def index(%{state_lookup: state_lookup}) do
    %{data: for(state_lookup <- state_lookup, do: data(state_lookup))}
  end

  @doc """
  Renders a single state_lookup.
  """
  def show(%{state_lookup: state_lookup}) do
    %{data: data(state_lookup)}
  end

  defp data(%StateLookup{} = state_lookup) do
    %{
      id: state_lookup.id,
      state_name: state_lookup.state_name,
      state_code: state_lookup.state_code
    }
  end
end
