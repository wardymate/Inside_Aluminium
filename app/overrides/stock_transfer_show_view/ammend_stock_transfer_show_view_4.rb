Deface::Override.new(:virtual_path => 'spree/admin/stock_transfers/show',
  :name => 'ammend_stock_transfer_show_view_4',
  :replace => "erb[loud]:contains(':stock_transfer)')" ,
  :text => "

          Purchase Order

    ")
