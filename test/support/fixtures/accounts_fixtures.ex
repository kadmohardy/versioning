defmodule Versioning.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Versioning.Accounts` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        age: 42,
        email: "some email",
        name: "some name"
      })
      |> Versioning.Accounts.create_user()

    user
  end
end
