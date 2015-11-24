Deface::Override.new(:virtual_path => 'spree/admin/stock_transfers/_stock_movements',
  :name => 'ammend_stock_movements_partial_4',
  :remove => "tbody#bulk_variants_tbody tr td:nth-of-type(4) erb[loud]",
)
