Deface::Override.new(:virtual_path => 'spree/admin/stock_transfers/_stock_movements',
  :name => 'ammend_stock_movements_partial_2',
  :insert_after => "tbody#bulk_variants_tbody tr td:nth-of-type(3) erb[loud]",
  :text => "

        <td><%= movement.sales_order_number %></td>
        <td><%= movement.estimated_arrival_date %></td>
        <td><%= movement.status %></td>

    ")
