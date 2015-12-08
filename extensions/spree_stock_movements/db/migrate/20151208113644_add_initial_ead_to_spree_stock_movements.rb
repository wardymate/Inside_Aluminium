class AddInitialEadToSpreeStockMovements < ActiveRecord::Migration
  def change
    add_column :spree_stock_movements, :initial_ead, :date
  end
end
