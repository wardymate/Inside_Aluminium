Deface::Override.new(:virtual_path => 'spree/admin/stock_transfers/_stock_movements',
  :name => 'ammend_stock_movements_partial_3',
  :remove => "thead[data-hook=bulk_variants_header] tr th:nth-of-type(4) erb[loud]",
)
