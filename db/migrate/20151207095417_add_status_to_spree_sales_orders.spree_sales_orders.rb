# This migration comes from spree_sales_orders (originally 20151207095311)
class AddStatusToSpreeSalesOrders < ActiveRecord::Migration
  def change
    add_column :spree_sales_orders, :status, :string
  end
end
