Deface::Override.new(:virtual_path => 'spree/admin/stock_transfers/index',
  :name => 'ammend_stock_transfer_index_view_5',
  :replace => "erb[loud]:contains('plural_resource_name')",
  :text => "

      <strong>Purchase Orders</strong>

    ")
