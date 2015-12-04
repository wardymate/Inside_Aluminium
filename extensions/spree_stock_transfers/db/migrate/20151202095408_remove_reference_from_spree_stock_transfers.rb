class RemoveReferenceFromSpreeStockTransfers < ActiveRecord::Migration
  def change
    remove_column :spree_stock_transfers, :reference, :string
  end
end
