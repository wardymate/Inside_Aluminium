# # This code relates to estimated delivery date for out of stock items
#
# Deface::Override.new(:virtual_path => 'spree/checkout/_delivery',
#   :name => 'delivery_date_for_out_of_stock_items',
#   :replace => "erb[loud]:contains('Spree.t(:item)')",
#   :text => "
#         <% ship_form.object.manifest.each do |item| %>
#           <% if item.variant.in_stock? %>
#             <%= 'IN STOCK' %>
#           <% else %>
#             <%= 'NOT IN STOCK' %>
#           <% end %>
#         <% end %>
#
#     ")
