defmodule Versioning.Repo do
  use Ecto.Repo,
    otp_app: :versioning,
    adapter: Ecto.Adapters.Postgres
end
