defmodule VersioningWeb.UserController do
  use VersioningWeb, :controller

  require Logger

  alias Versioning.Accounts
  alias Versioning.Accounts.User

  action_fallback VersioningWeb.FallbackController

  def index(conn, _params) do
    users = Accounts.list_users()
    render(conn, "index.json", users: users)
  end

  def create(conn, params) do
    Logger.info("Creating user #{inspect(params)}")

    with {:ok, %User{} = user} <- Accounts.create_user(params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.user_path(conn, :show, user))
      |> render("show.json", user: user)
    end
  end

  def show(%{assigns: %{version: "v1"}} = conn, %{"id" => id}) do
    user = Accounts.get_user!(id)
    render(conn, "show.v1.json", user: user)
  end

  def show(%{assigns: %{version: "v2"}} = conn, %{"id" => id}) do
    user = Accounts.get_user!(id)
    render(conn, "show.v2.json", user: user)
  end

  def show(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)
    render(conn, "show.json", user: user)
  end
end
