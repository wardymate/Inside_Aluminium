# This migration comes from spree_estimated_delivery_dates (originally 20151118171409)
class AddCountOnOrderToSpreeStockItems < ActiveRecord::Migration
  def change
    add_column :spree_stock_items, :count_on_order, :integer
  end
end
