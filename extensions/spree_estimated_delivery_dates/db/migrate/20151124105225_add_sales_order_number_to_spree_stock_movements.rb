class AddSalesOrderNumberToSpreeStockMovements < ActiveRecord::Migration
  def change
    add_column :spree_stock_movements, :sales_order_number, :text
  end
end
