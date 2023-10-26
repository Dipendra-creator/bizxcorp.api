defmodule Bizxcorp.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      BizxcorpWeb.Telemetry,
      # Start the Ecto repository
      Bizxcorp.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Bizxcorp.PubSub},
      # Start Finch
      {Finch, name: Bizxcorp.Finch},
      # Start the Endpoint (http/https)
      BizxcorpWeb.Endpoint
      # Start a worker by calling: Bizxcorp.Worker.start_link(arg)
      # {Bizxcorp.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Bizxcorp.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    BizxcorpWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
