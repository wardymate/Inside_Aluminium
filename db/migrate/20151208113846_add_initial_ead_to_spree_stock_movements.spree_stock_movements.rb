# This migration comes from spree_stock_movements (originally 20151208113644)
class AddInitialEadToSpreeStockMovements < ActiveRecord::Migration
  def change
    add_column :spree_stock_movements, :initial_ead, :date
  end
end
