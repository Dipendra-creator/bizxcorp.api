defmodule BizxcorpWeb.Auth.Guardian do
  use Guardian, otp_app: :bizxcorp

  alias Bizxcorp.Users

  def subject_for_token(%{id: id}, _claims) do
    sub = to_string(id)
    {:ok, sub}
  end

  def subject_for_token(_, _claims) do
    {:error, :no_subject}
  end

  def resource_from_claims(%{"sub" => sub}) do
    case Users.get_user!(sub) do
      nil -> {:error, :no_resource}
      user -> {:ok, user}
    end
  end

  def resource_from_claims(_claims) do
    {:error, :no_resource}
  end

  def authenticate(email, password) do
    case Users.get_user_by_email(email) do
      nil -> {:error, :user_not_found}
      user ->
        case Pbkdf2.verify_pass(password, user.password) do
          true -> create_token(user)
          false -> {:error, :unauthenticated}
        end
    end
  end

  def create_token(user) do
    {:ok, jwt, _full_claims} = encode_and_sign(user)
    {:ok, user, jwt}
  end

end
