# This migration comes from spree_estimated_delivery_dates (originally 20151112201456)
class AddEstimatedDeliveryDateToSpreeShipments < ActiveRecord::Migration
  def change
    add_column :spree_shipments, :estimated_delivery_date, :datetime
  end
end
