# This migration comes from spree_sales_orders (originally 20151201111134)
class AddEstimatedArrivalDateToSpreeSalesOrders < ActiveRecord::Migration
  def change
    add_column :spree_sales_orders, :estimated_arrival_date, :date
  end
end
