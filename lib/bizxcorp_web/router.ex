defmodule BizxcorpWeb.Router do
  use BizxcorpWeb, :router
  use Plug.ErrorHandler

  defp handle_errors(conn, %{reason: %Phoenix.Router.NoRouteError{message: message}}) do
    conn
    |> json(%{errors: message})
    |> halt()
  end

  defp handle_errors(conn, %{reason: %{message: message}}) do
    conn
    |> json(%{errors: message})
    |> halt()
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :auth do
    plug BizxcorpWeb.Auth.Pipeline
  end

  scope "/api", BizxcorpWeb do
    pipe_through :api
    post "/users/create", UserController, :create
    post "/users/sign_in", UserController, :sign_in
  end

  scope "/api", BizxcorpWeb do
    pipe_through [:api, :auth]

    get "/users", UserController, :index

    get "/users/:id", UserController, :show
    put "/users/:id", UserController, :update
    delete "/users/:id", UserController, :delete
  end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:bizxcorp, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through [:fetch_session, :protect_from_forgery]

      live_dashboard "/dashboard", metrics: BizxcorpWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
