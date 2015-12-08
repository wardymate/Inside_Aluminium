class RemoveSalesOrderNumberFromSpreeStockMovements < ActiveRecord::Migration
  def change
    remove_column :spree_stock_movements, :sales_order_number, :text
  end
end
