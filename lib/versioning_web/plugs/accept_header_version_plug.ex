defmodule VersioningWeb.Plugs.AcceptHeaderVersionPlug do
  import Plug.Conn

  def init(opts), do: opts

  def call(conn, _opts) do
    [accept] = get_req_header(conn, "accept")

    version = MIME.extensions(accept)
    IO.inspect(version)
    handle_version(conn, version)
  end

  defp handle_version(conn, [version]) do
    assign(conn, :version, version)
  end

  defp handle_version(conn, _) do
    conn
    |> send_resp(404, "Not Found")
    |> halt()
  end
end
