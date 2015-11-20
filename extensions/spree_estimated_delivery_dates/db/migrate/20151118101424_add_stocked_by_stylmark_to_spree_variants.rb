class AddStockedByStylmarkToSpreeVariants < ActiveRecord::Migration
  def change
    add_column :spree_variants, :stocked_by_stylmark, :boolean
  end
end
