# This migration comes from spree_estimated_delivery_dates (originally 20151118131856)
class AddProjectedCountOnHandToSpreeStockItems < ActiveRecord::Migration
  def change
    add_column :spree_stock_items, :projected_count_on_hand, :integer
  end
end
