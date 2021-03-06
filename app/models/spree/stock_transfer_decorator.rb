module Spree
  StockTransfer.class_eval do

    has_many :sales_orders

    alias_method :orig_transfer, :transfer
    def transfer(source_location, destination_location, variants)

      transaction do
        variants.each_pair do |variant, quantity|
          source_location.unstock(variant, quantity, self) if source_location
          destination_location.restock(variant, quantity, self)

          self.source_location = source_location
          self.destination_location = destination_location
          self.save!
        end
      end
    end

    def transfer_1(source_location, destination_location, variants, sales_order_id)
      transaction do
        variants.each_pair do |variant, quantity|
          source_location.unstock(variant, quantity, self) if source_location
          destination_location.restock_1(variant, quantity, self, sales_order_id)

          self.source_location = source_location
          self.destination_location = destination_location
          self.save!
        end
      end
    end

    alias_method :orig_to_param, :to_param
    def to_param
      id
    end

  end
end
