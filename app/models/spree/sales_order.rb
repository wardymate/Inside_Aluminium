class Spree::SalesOrder < ActiveRecord::Base
  belongs_to :stock_transfer
  has_many :stock_movements

end
