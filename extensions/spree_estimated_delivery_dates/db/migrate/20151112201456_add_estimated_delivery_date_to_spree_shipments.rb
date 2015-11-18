class AddEstimatedDeliveryDateToSpreeShipments < ActiveRecord::Migration
  def change
    add_column :spree_shipments, :estimated_delivery_date, :datetime
  end
end
