# This migration comes from spree_estimated_delivery_dates (originally 20151124105225)
class AddSalesOrderNumberToSpreeStockMovements < ActiveRecord::Migration
  def change
    add_column :spree_stock_movements, :sales_order_number, :text
  end
end
