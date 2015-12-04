# This migration comes from spree_stock_transfers (originally 20151202095217)
class AddStatusToSpreeStockTransfers < ActiveRecord::Migration
  def change
    add_column :spree_stock_transfers, :status, :string
  end
end
