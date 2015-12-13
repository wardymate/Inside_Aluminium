Deface::Override.new(:virtual_path => 'spree/admin/stock_transfers/index',
  :name => 'ammend_stock_transfer_index_view_6',
  :replace => "erb[loud]:contains('button_link_to')",
  :text => "

      <%= button_link_to Spree.t(:new_purchase_order), new_admin_stock_transfer_path, { :icon => 'add', :class => 'btn-success' } %>

    ")
