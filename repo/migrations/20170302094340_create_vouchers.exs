defmodule PsascVoucherSite.Repo.Migrations.CreateVouchers do
  use Ecto.Migration

  def change do
    drop_if_exists table(:vouchers)
    create table(:vouchers) do
              add :name, :string
              add :cost, :float
              add :description, :string
              add :state, :string
        end
  end
end
