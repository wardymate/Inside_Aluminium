# This migration comes from spree_sales_orders (originally 20151130134604)
class AddSalesOrderIdToSpreeStockMovements < ActiveRecord::Migration
  def change
    add_reference :spree_stock_movements, :sales_order, index: true, foreign_key: true
  end
end
