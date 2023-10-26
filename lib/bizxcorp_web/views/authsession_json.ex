defmodule BizxcorpWeb.AuthsessionJSON do
  alias Bizxcorp.Users.Authsession

  @doc """
  Renders a list of authsession.
  """
  def index(%{authsession: authsession}) do
    %{data: for(authsession <- authsession, do: data(authsession))}
  end

  @doc """
  Renders a single authsession.
  """
  def show(%{authsession: authsession}) do
    %{data: data(authsession)}
  end

  defp data(%Authsession{} = authsession) do
    %{
      id: authsession.id,
      token: authsession.token,
      user_device: authsession.user_device,
      user_ip: authsession.user_ip,
      user_agent: authsession.user_agent,
      last_used_at: authsession.last_used_at,
      deleted_at: authsession.deleted_at
    }
  end
end
