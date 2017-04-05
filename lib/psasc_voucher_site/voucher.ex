defmodule PsascVoucherSite.Voucher do
  @moduledoc false
  use Ecto.Schema
  schema "vouchers" do
    field :name, :string
    field :cost, :float
    field :description, :string
    field :state, :string
  end
end