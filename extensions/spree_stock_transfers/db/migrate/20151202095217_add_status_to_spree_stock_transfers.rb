class AddStatusToSpreeStockTransfers < ActiveRecord::Migration
  def change
    add_column :spree_stock_transfers, :status, :string
  end
end
