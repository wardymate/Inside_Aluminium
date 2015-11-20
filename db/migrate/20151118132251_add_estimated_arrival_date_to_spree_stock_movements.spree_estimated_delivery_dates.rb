# This migration comes from spree_estimated_delivery_dates (originally 20151118131604)
class AddEstimatedArrivalDateToSpreeStockMovements < ActiveRecord::Migration
  def change
    add_column :spree_stock_movements, :estimated_arrival_date, :date
  end
end
