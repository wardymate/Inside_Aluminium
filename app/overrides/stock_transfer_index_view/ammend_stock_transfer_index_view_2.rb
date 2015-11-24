Deface::Override.new(:virtual_path => 'spree/admin/stock_transfers/index',
  :name => 'ammend_stock_transfer_index_view_2',
  :insert_after => "thead",
  :text => "

        <tr data-hook='stock_transfers_header'>
          <th><%= Spree.t(:purchase_order_number) %></th>
          <th><%= Spree.t(:created_at) %></th>
          <th><%= Spree.t(:sales_order_number) %></th>
          <th><%= Spree.t(:due_to_arrive) %></th>
          <th><%= Spree.t(:status) %></th>
          <th class='actions'></th>
        </tr>

    ")
