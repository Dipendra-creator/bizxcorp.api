defmodule Bizxcorp.Repo do
  use Ecto.Repo,
    otp_app: :bizxcorp,
    adapter: Ecto.Adapters.Postgres
end
