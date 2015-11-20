module Spree
  StockItem.class_eval do
    def adjust_projected_count_hand(value)
      self.with_lock do
        self.projected_count_on_hand = (self.projected_count_on_hand + value)
        self.save!
      end
    end
  end
end

module Spree
  StockItem.class_eval do
    def adjust_count_on_order(value)
      self.with_lock do
        self.count_on_order = (self.count_on_order + value)
        self.save!
      end
    end
  end
end
