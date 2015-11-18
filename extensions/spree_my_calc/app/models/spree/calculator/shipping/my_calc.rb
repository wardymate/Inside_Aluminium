module Spree
  class Calculator::Shipping::MyCalc < ShippingCalculator
    def self.description
      "Tuffnells - Next Day (Before 09:30)"
    end

    def compute_package(package)
      total_weight = package.weight
      shipping_costs = 0.00
      if total_weight <= 44
        shipping_costs += 52.50
      else
        shipping_costs += ((52.50) + (((total_weight - 44) / 2.2) * 0.9))
      end
    end
  end
end
