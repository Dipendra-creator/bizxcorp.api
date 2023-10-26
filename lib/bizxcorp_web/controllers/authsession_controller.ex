defmodule BizxcorpWeb.AuthsessionController do
  use BizxcorpWeb, :controller

  alias Bizxcorp.Users
  alias Bizxcorp.Users.Authsession

  action_fallback BizxcorpWeb.FallbackController

  def index(conn, _params) do
    authsession = Users.list_authsession()
    render(conn, :index, authsession: authsession)
  end

  def create(conn, %{"authsession" => authsession_params}) do
    with {:ok, %Authsession{} = authsession} <- Users.create_authsession(authsession_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/authsession/#{authsession}")
      |> render(:show, authsession: authsession)
    end
  end

  def show(conn, %{"id" => id}) do
    authsession = Users.get_authsession!(id)
    render(conn, :show, authsession: authsession)
  end

  def update(conn, %{"id" => id, "authsession" => authsession_params}) do
    authsession = Users.get_authsession!(id)

    with {:ok, %Authsession{} = authsession} <- Users.update_authsession(authsession, authsession_params) do
      render(conn, :show, authsession: authsession)
    end
  end

  def delete(conn, %{"id" => id}) do
    authsession = Users.get_authsession!(id)

    with {:ok, %Authsession{}} <- Users.delete_authsession(authsession) do
      send_resp(conn, :no_content, "")
    end
  end
end
