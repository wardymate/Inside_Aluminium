# This migration comes from spree_estimated_delivery_dates (originally 20151118132051)
class AddStatusToSpreeStockMovements < ActiveRecord::Migration
  def change
    add_column :spree_stock_movements, :status, :string
  end
end
