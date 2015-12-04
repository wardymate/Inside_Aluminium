# This migration comes from spree_stock_transfers (originally 20151202095408)
class RemoveReferenceFromSpreeStockTransfers < ActiveRecord::Migration
  def change
    remove_column :spree_stock_transfers, :reference, :string
  end
end
