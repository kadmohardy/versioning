defmodule VersioningWeb.UserView do
  use VersioningWeb, :view
  alias VersioningWeb.UserView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{
      id: user.id,
      name: user.name,
      email: user.email
    }
  end

  def render("show.v1.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.v1.json")}
  end

  def render("user.v1.json", %{user: user}) do
    %{
      id: user.id,
      name: user.name,
      email: user.email
    }
  end

  def render("show.v2.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.v2.json")}
  end

  def render("user.v2.json", %{user: user}) do
    %{
      id: user.id,
      name: user.name,
      age: user.age,
      email: user.email
    }
  end
end
