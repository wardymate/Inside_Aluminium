class AddStatusToSpreeStockMovements < ActiveRecord::Migration
  def change
    add_column :spree_stock_movements, :status, :string
  end
end
