defmodule PsascVoucherSite.NonAdmin.NonAdminRouter do
    use Plug.Router
  @moduledoc false

  plug :match
  plug :dispatch

  get "/hello" do
    send_resp(conn, 200, "world")
  end

   match _ do
        send_resp(conn, 404, "oops")
    end
  
end