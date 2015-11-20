class AddCountOnOrderToSpreeStockItems < ActiveRecord::Migration
  def change
    add_column :spree_stock_items, :count_on_order, :integer
  end
end
