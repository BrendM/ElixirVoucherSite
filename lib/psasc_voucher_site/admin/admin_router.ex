defmodule PsascVoucherSite.Admin.AdminRouter do
use Plug.Router
require Logger
import Ecto.Query
  @moduledoc false

  plug :match
  plug :dispatch

  get "/users" do
    respond(conn, Poison.encode(Stream.map(PsascVoucherSite.User |> PsascVoucherSite.Repo.all, fn(user) -> %{admin: user.admin, email: user.email, name: user.name, id: user.id} end)))
  end

  get "/vouchers" do
    respond(conn, Poison.encode(Stream.map(PsascVoucherSite.Voucher |> PsascVoucherSite.Repo.all, fn(voucher) -> %{state: voucher.state,description: voucher.description ,cost: voucher.cost, name: voucher.name, id: voucher.id} end)))
  end

  get "/orders" do
    respond(conn, Poison.encode(Stream.map(PsascVoucherSite.Order |> PsascVoucherSite.Repo.all, fn(order) -> %{amount: order.amount, comment: order.comment,timestamp: order.timestamp, total_cost: order.total_cost, id: order.id} end)))
  end

  delete "/users" do
     {num, _} = (from(u in PsascVoucherSite.User) |> PsascVoucherSite.Repo.delete_all)
     inspect num
    respond(conn, {:ok, Poison.encode!(%{message: "Users deleted"})})
  end

  put "/user" do
    user_json = conn.body_params

    user = %PsascVoucherSite.User{email: user_json["email"], name: user_json["name"], password: user_json["password"],
    admin: user_json["admin"], excel_friendly_name: user_json["excel_friendly_name"]}

    {res, _} = (PsascVoucherSite.Repo.insert user);
    respond(conn,{res, Poison.encode!(%{message: "User Added"})})
  end

  match _ do
    send_resp(conn, 404, "oops")
  end

  def respond(conn, {:ok, res}), do: conn |> put_resp_content_type("text/json") |> send_resp(200, res)
  def respond(conn, {:err, _}) do
    e_m = "Failed to generate admin response"
    Logger.error(e_m)
    send_resp(conn, 500, e_m)
  end
end