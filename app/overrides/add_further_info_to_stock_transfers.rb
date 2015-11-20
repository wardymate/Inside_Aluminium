Deface::Override.new(:virtual_path => 'spree/admin/stock_transfers/_stock_movements',
  :name => 'add_further_info_to_stock_transfers',
  :insert_after => "tbody#bulk_variants_tbody tr td:nth-of-type(4) erb[loud]",
  :text => "

        <td><%= movement.stock_item.count_on_order %></td>
        <td><%= movement.stock_item.projected_count_on_hand %></td>
        <td><%= movement.estimated_arrival_date %></td>
        <td><%= movement.status %></td>

    ")
