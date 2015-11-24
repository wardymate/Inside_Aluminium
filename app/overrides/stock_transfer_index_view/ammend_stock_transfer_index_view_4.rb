Deface::Override.new(:virtual_path => 'spree/admin/stock_transfers/index',
  :name => 'ammend_stock_transfer_index_view_4',
  :insert_after => "tbody",
  :text => "

  <% @stock_transfers.each do |stock_transfer| %>
    <tr id='<%= spree_dom_id stock_transfer %>' data-hook='stock_transfer_row'>
      <td><%= link_to stock_transfer.number, admin_stock_transfer_path(stock_transfer.id) %></td>
      <td><%= stock_transfer.created_at %></td>
      <% stock_transfer.stock_movements.each do |stock_movement|%>
        <td><%= stock_movement.sales_order_number %></td>
        <td><%= stock_movement.estimated_arrival_date %></td>
        <td><%= stock_movement.status %></td>
      <% end %>
    </tr>
  <% end %>

    ")
