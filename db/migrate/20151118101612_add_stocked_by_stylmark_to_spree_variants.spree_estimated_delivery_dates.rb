# This migration comes from spree_estimated_delivery_dates (originally 20151118101424)
class AddStockedByStylmarkToSpreeVariants < ActiveRecord::Migration
  def change
    add_column :spree_variants, :stocked_by_stylmark, :boolean
  end
end
