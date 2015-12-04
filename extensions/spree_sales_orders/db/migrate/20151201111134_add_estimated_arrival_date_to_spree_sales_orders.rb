class AddEstimatedArrivalDateToSpreeSalesOrders < ActiveRecord::Migration
  def change
    add_column :spree_sales_orders, :estimated_arrival_date, :date
  end
end
