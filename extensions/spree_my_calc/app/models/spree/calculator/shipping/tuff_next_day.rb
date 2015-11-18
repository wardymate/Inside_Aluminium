module Spree
  class Calculator::Shipping::TuffNextDay < ShippingCalculator
    def self.description
      "Tuffnells - Next Day"
    end

    def compute_package(package)
      total_weight = package.weight
      shipping_costs = 0.00
      if total_weight <= 44
        shipping_costs += 27.45
      else
        shipping_costs += ((27.45) + (((total_weight - 44) / 2.2) * 0.5))
      end
    end
  end
end
