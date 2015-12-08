class AddStatusToSpreeSalesOrders < ActiveRecord::Migration
  def change
    add_column :spree_sales_orders, :status, :string
  end
end
