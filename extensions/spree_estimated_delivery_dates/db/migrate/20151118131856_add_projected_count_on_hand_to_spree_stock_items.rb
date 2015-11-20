class AddProjectedCountOnHandToSpreeStockItems < ActiveRecord::Migration
  def change
    add_column :spree_stock_items, :projected_count_on_hand, :integer
  end
end
