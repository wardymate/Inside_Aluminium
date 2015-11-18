# This migration comes from spree_estimated_delivery_dates (originally 20151116125018)
class ChangeDataTypeForEstimatedDeliveryDate < ActiveRecord::Migration
  def self.up
    change_table :spree_shipments do |t|
      t.change :estimated_delivery_date, :date
    end
  end
  def self.down
    change_table :spree_shipments do |t|
      t.change :estimated_delivery_date, :datetime
    end
  end
end
