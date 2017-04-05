defmodule PsascVoucherSite.Order do
  @moduledoc false
  use Ecto.Schema
  schema "orders" do
    belongs_to :user, User, define_field: false
    belongs_to :voucher, Voucher, define_field: false
    field :user_id, :integer
    field :voucher_id, :integer
    field :timestamp, :date
    field :amount, :integer
    field :total_cost, :float
    field :comment, :string
  end
end