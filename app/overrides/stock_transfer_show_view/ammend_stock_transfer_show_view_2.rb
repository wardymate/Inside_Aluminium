Deface::Override.new(:virtual_path => 'spree/admin/stock_transfers/show',
  :name => 'ammend_stock_transfer_show_view_2',
  :remove => "erb[silent]:contains('page_actions')",
  :closing_selector => "erb[silent]:contains('end')"

    )
