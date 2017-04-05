defmodule PsascVoucherSite.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    drop_if_exists table(:orders)
    drop_if_exists table(:vouchers)
    drop_if_exists table(:users)
    create table(:users) do
          add :email, :string
          add :name, :string
          add :password, :string
          add :admin, :bool
          add :excel_friendly_name, :string
        end
  end
end
