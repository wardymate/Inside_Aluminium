# This code relates to estimated delivery date for in stock items

Deface::Override.new(:virtual_path => 'spree/admin/stock_transfers/_stock_movements',
  :name => 'add_projected_count_on_hand_to_stock_transfers',
  :insert_after => "thead[data-hook=bulk_variants_header] tr th:nth-of-type(4) erb[loud]",
  :text => "

        <th> ON ORDER </th>
        <th> PROJECTED </th>
        <th> DUE TO ARRIVE </th>
        <th> STATUS </th>

    ")
