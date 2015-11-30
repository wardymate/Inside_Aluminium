class AddSalesOrderIdToSpreeStockMovements < ActiveRecord::Migration
  def change
    add_reference :spree_stock_movements, :sales_order, index: true, foreign_key: true
  end
end
