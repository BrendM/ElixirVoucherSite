defmodule PsascVoucherSite.Authenticate do
  @moduledoc false
  import Plug.Conn

    def init(opts), do: opts

    def authenticated?(conn) do
      # Implement authentication logic here, e.g. check auth headers,
      true
    end

    def call(conn, _opts) do
      if authenticated?(conn) do
        conn
      else
        conn
        |> send_resp(401, "Authentication required")
        |> halt
      end
    end
end