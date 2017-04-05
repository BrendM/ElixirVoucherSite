defmodule PsascVoucherSite.Repo.Migrations.CreateOrders do
  use Ecto.Migration

  def change do
   drop_if_exists table(:orders)
    create table(:orders) do
          add :user_id, references(:users)
          add :voucher_id, references(:vouchers)
          add :timestamp, :date
          add :amount, :integer
          add :total_cost, :float
          add :comment, :string
        end
  end
end
