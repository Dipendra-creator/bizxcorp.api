defmodule BizxcorpWeb.UserJSON do
  alias Bizxcorp.Users.User

  @doc """
  Renders a list of user.
  """
  def index(%{user: user}) do
    %{data: for(user <- user, do: data(user))}
  end

  @doc """
  Renders a single user.
  """
  def show(%{user: user}) do
    %{data: data(user)}
  end

  def token(%{user: user, token: token}) do
    %{
      id: user.id,
      name: user.name,
      email: user.email,
      username: user.username,
      token: token
    }
  end

  defp data(%User{} = user) do
    %{
      id: user.id,
      name: user.name,
      dob: user.dob,
      email: user.email,
      username: user.username,
      phone: user.phone,
      role: user.role,
      status: user.status,
      experience: user.experience,
      organization_join_date: user.organization_join_date,
      salary: user.salary,
      number_of_posts: user.number_of_posts,
      last_seen: user.last_seen
    }
  end
end
