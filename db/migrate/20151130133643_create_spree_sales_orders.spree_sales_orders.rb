# This migration comes from spree_sales_orders (originally 20151130133506)
class CreateSpreeSalesOrders < ActiveRecord::Migration
  def change
    create_table :spree_sales_orders do |t|
      t.integer :number
      t.references :stock_transfer, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
