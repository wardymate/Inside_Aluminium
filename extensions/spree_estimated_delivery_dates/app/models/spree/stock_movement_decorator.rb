module Spree
  StockMovement.class_eval do
    belongs_to :sales_order
  end
end

module Spree
  StockMovement.class_eval do
    alias_method :orig_readonly?, :readonly?
    def readonly?

    end
  end
end

module Spree
  StockMovement.class_eval do
    alias_method :orig_update_stock_item_quantity, :update_stock_item_quantity
    def update_stock_item_quantity

      # AMOUNT ON ORDER
      stock_item.adjust_count_on_order(quantity)

      #PROJECTED COUNT ON HAND
      stock_item.adjust_projected_count_hand

      #ESTIMATED ARRIVAL DATE
      a = self.stock_item_id
      b = Spree::Variant.find(a).stocked_by_stylmark?
      c = self.created_at
      d = self.estimated_arrival_date

      if c.monday? == true && c.hour < 12 && b == false
        d = c.to_date + 9
      elsif c.monday? == true && c.hour < 12 && b == true
        d = c.to_date + 9
      elsif c.monday? == true && c.hour >= 12 && b == false
        d = c.to_date + 9
      elsif c.monday? == true && c.hour >= 12 && b == true
        d = c.to_date + 9

      elsif c.tuesday? == true && c.hour < 12 && b == false
        d = c.to_date + 8
      elsif c.tuesday? == true && c.hour < 12 && b == true
        d = c.to_date + 8
      elsif c.tuesday? == true && c.hour >= 12 && b == false
        d = c.to_date + 15
      elsif c.tuesday? == true && c.hour >= 12 && b == true
        d = c.to_date + 8

      elsif c.wednesday? == true && c.hour < 12 && b == false
        d = c.to_date + 14
      elsif c.wednesday? == true && c.hour < 12 && b == true
        d = c.to_date + 7
      elsif c.wednesday? == true && c.hour >= 12 && b == false
        d = c.to_date + 14
      elsif c.wednesday? == true && c.hour >= 12 && b == true
        d = c.to_date + 7

      elsif c.thursday? == true && c.hour < 12 && b == false
        d = c.to_date + 13
      elsif c.thursday? == true && c.hour < 12 && b == true
        d = c.to_date + 6
      elsif c.thursday? == true && c.hour >= 12 && b == false
        d = c.to_date + 13
      elsif c.thursday? == true && c.hour >= 12 && b == true
        d = c.to_date + 13

      elsif c.friday? == true && c.hour < 12 && b == false
        d = c.to_date + 12
      elsif c.friday? == true && c.hour < 12 && b == true
        d = c.to_date + 12
      elsif c.friday? == true && c.hour >= 12 && b == false
        d = c.to_date + 12
      elsif c.friday? == true && c.hour >= 12 && b == true
        d = c.to_date + 12

      elsif c.saturday? == true && c.hour < 12 && b == false
        d = c.to_date + 11
      elsif c.saturday? == true && c.hour < 12 && b == true
        d = c.to_date + 11
      elsif c.saturday? == true && c.hour >= 12 && b == false
        d = c.to_date + 11
      elsif c.saturday? == true && c.hour >= 12 && b == true
        d = c.to_date + 11

      elsif c.sunday? == true && c.hour < 12 && b == false
        d = c.to_date + 10
      elsif c.sunday? == true && c.hour < 12 && b == true
        d = c.to_date + 10
      elsif c.sunday? == true && c.hour >= 12 && b == false
        d = c.to_date + 10
      elsif c.sunday? == true && c.hour >= 12 && b == true
        d = c.to_date + 10
      end

      self.update(estimated_arrival_date: d)
      #ORDER STATUS
      self.update(status: "On Order")
    end
  end
end


module Spree
  StockMovement.class_eval do
    def update_stock_on_order_completion(stock_movement)
      stock_movement.stock_item.adjust_count_on_hand(stock_movement.quantity)
      b = stock_movement.stock_item.count_on_order - stock_movement.quantity
      c = stock_movement.stock_item.count_on_hand + b
      stock_movement.stock_item.update(count_on_order: b, projected_count_on_hand: c)
    end
  end
end
