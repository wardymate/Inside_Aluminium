# This code relates to estimated delivery date for in stock items

Deface::Override.new(:virtual_path => 'spree/admin/stock_transfers/_stock_movements',
  :name => 'ammend_stock_movements_partial_1',
  :insert_after => "thead[data-hook=bulk_variants_header] tr th:nth-of-type(3) erb[loud]",
  :text => "

        <th> SALES ORDER NUMBER </th>
        <th> DUE TO ARRIVE </th>
        <th> STATUS </th>

    ")
