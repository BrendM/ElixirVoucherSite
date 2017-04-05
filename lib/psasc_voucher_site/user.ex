defmodule PsascVoucherSite.User do
  @moduledoc false
  use Ecto.Schema
  schema "users" do
    field :email, :string
    field :name, :string
    field :password, :string
    field :admin, :boolean
    field :excel_friendly_name, :string
  end
end