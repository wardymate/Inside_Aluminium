Deface::Override.new(:virtual_path => 'spree/admin/stock_transfers/show',
  :name => 'ammend_stock_transfer_show_view_1',
  :remove => "erb[silent]:contains('page_title')",
  :closing_selector => "erb[silent]:contains('end')"

    )
