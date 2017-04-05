defmodule SiteRouter do
    use Plug.Router
  @moduledoc false

  plug Plug.Logger
  plug Plug.Static,at: "/",from: {:psasc_voucher_site, "/priv/static/public/"}
  plug PsascVoucherSite.Authenticate
  plug Plug.Parsers, parsers: [:json],
                    json_decoder: Poison
  plug :match
  plug :dispatch

  #Plug.Adapters.Cowboy.http SiteRouter, []

  #non admin
  forward "/non_admin" , to: PsascVoucherSite.NonAdmin.NonAdminRouter
  #admin
  forward "/admin" , to: PsascVoucherSite.Admin.AdminRouter

  match _ do
      send_resp(conn, 404, "oops")
  end

end