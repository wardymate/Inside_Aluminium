Deface::Override.new(:virtual_path => 'spree/admin/stock_transfers/index',
  :name => 'ammend_stock_transfer_index_view_4',
  :insert_after => "tbody",
  :text => "

  <% @stock_transfers.each do |stock_transfer| %>
    <tr id='<%= spree_dom_id stock_transfer %>' data-hook='stock_transfer_row'>
      <td><%= link_to stock_transfer.number, admin_stock_transfer_path(stock_transfer) %></td>
      <td><%= stock_transfer.created_at %></td>
      <td><%= stock_transfer.status %></td>
    </tr>
  <% end %>

    ")
