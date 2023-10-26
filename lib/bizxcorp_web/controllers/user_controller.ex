defmodule BizxcorpWeb.UserController do
  use BizxcorpWeb, :controller

  alias Bizxcorp.{Users, Users.User}
  alias BizxcorpWeb.Auth.{Guardian, ErrorResponse}

  action_fallback BizxcorpWeb.FallbackController

  def index(conn, _params) do
    user = Users.list_user()
    render(conn, :index, user: user)
  end

  def create(conn, %{"user" => user_params}) do
    with {:ok, %User{} = user} <- Users.create_user(user_params),
          {:ok, token, _claims} <- BizxcorpWeb.Auth.Guardian.encode_and_sign(user) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/user/#{user}")
      |> render(:token, %{user: user, token: token})
    end
  end

  def sign_in(conn, %{"email" => email, "password" => password}) do
    case Guardian.authenticate(email, password) do
      {:ok, user, token} ->
        conn
        |> put_status(:ok)
        |> render(:token, %{user: user, token: token})
      {:error, :unauthorized} -> raise ErrorResponse.Unauthorized, message: "Invalid credentials"
    end
  end

  @spec show(Plug.Conn.t(), map()) :: Plug.Conn.t()
  def show(conn, %{"id" => id}) do
    user = Users.get_user!(id)
    render(conn, :show, user: user)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Users.get_user!(id)

    with {:ok, %User{} = user} <- Users.update_user(user, user_params) do
      render(conn, :show, user: user)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Users.get_user!(id)

    with {:ok, %User{}} <- Users.delete_user(user) do
      send_resp(conn, :no_content, "")
    end
  end
end
