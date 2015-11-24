Deface::Override.new(:virtual_path => 'spree/admin/stock_transfers/show',
  :name => 'ammend_stock_transfer_show_view_3',
  :insert_before => "fieldset:nth-of-type(1)" ,
  :text => "

        <% content_for :page_title do %>
           Purchase Order (<%= @stock_transfer.number %>)
        <% end %>

        <% content_for :page_actions do %>
          <% @stock_transfer.stock_movements.each do |stock_movement|%>
              <%= button_link_to Spree.t(:update_order), edit_admin_stock_location_stock_movement_path(1, stock_movement.id), { :class => 'btn-primary' } %>
          <% end %>




          <%= button_link_to Spree.t(:new_stock_transfer), new_admin_stock_transfer_path, { :icon => 'add', :class => 'btn-success' } %>
        <% end if can? :create, Spree::StockTransfer %>

    ")
