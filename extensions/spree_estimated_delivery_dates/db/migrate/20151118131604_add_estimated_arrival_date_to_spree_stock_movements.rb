class AddEstimatedArrivalDateToSpreeStockMovements < ActiveRecord::Migration
  def change
    add_column :spree_stock_movements, :estimated_arrival_date, :date
  end
end
