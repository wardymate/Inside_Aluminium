# module Spree
#   StockLocation.class_eval do
#     alias_method :orig_restock, :restock
#     def restock(variant, quantity, originator = nil)
#       move(variant, quantity, originator)
#     end
#
#     alias_method :orig_move, :move
#     def move(variant, quantity, originator = nil)
#       stock_item_or_create(variant).stock_movements.create!(quantity: quantity,
#                                                             originator: originator)
#     end
#   end
# end
