# This migration comes from spree_stock_movements (originally 20151208113527)
class RemoveSalesOrderNumberFromSpreeStockMovements < ActiveRecord::Migration
  def change
    remove_column :spree_stock_movements, :sales_order_number, :text
  end
end
