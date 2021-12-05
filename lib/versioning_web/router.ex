defmodule VersioningWeb.Router do
  use VersioningWeb, :router

  pipeline :api do
    plug :accepts, ["v1", "v2"]
    plug VersioningWeb.Plugs.AcceptHeaderVersionPlug
  end

  scope "/api", VersioningWeb do
    pipe_through :api

    scope "/" do
      resources "/users", UserController
    end
  end

  # Enables the Swoosh mailbox preview in development.
  #
  # Note that preview only shows emails that were sent by the same
  # node running the Phoenix server.
  if Mix.env() == :dev do
    scope "/dev" do
      pipe_through [:fetch_session, :protect_from_forgery]

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
