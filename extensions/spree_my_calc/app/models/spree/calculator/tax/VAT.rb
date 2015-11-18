module Spree
  class Calculator::Tax::VAT < Calculator
    def self.description
      "TEST VAT"
    end

    def compute(package)
      total_item_cost = package.order.item_total
      total_shipping_cost = package.order.ship_total
      @vat = ((total_item_cost + total_shipping_cost) * 0.2)
    end
    @vat
  end
end
