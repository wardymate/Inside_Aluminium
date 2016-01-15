# This code relates to estimated delivery date for in stock items

# Lots wrong with this - a new object is being created with one of the paramters a partial html template with embedded logic. The embedded logic is also very badly written. use of undescriptive variables a,b and @c. a should be updated_at or something similar. b could be renamed as estimated_delivery_date and I think you get away without reassigning state to the @c variable. The huge if, elsif blocks should be extracted to an object class - in the view you would just make a method call to return the desired repsonse. Anyone I have worked with would not look at any more code from a developer if they saw this and would not consider them for work. Sounds harsh but is reality.

Deface::Override.new(:virtual_path => 'spree/checkout/_delivery',
  :name => 'ammend_checkout_delivery_partial',
  :insert_after => "ul.list-group",
  :text => "
    <h4 class='stock-shipping-method-title'> Estimated Delivery Date </h4>
    <ul class='list-group shipping-methods'>
      <li class='list-group-item shipping-method'>
        <label>
          <span class='rate-name'>

            <% a = ship_form.object.updated_at %>
            <% b = ship_form.object.estimated_delivery_date %>

            <% ship_form.object.manifest.each do |item| %>
              <% item.states.each do |state, quantity|  %>
                <% @c = state %>
              <% end %>
            <% end %>

            <% if @c == 'on_hand' %>

              <% if a.monday? == true && a.hour < 12 %>
                <% b = a.to_date + 1 %>
              <% elsif a.monday? == true && a.hour >= 12 %>
                <% b = a.to_date + 2 %>
              <% elsif a.tuesday? == true && a.hour < 12 %>
                <% b = a.to_date + 1 %>
              <% elsif a.tuesday? == true && a.hour >= 12 %>
                <% b = a.to_date + 2 %>
              <% elsif a.wednesday? == true && a.hour < 12 %>
                <% b = a.to_date + 1 %>
              <% elsif a.wednesday? == true && a.hour >= 12 %>
                <% b = a.to_date + 2 %>
              <% elsif a.thursday? == true && a.hour < 12 %>
                <% b = a.to_date + 1 %>
              <% elsif a.thursday? == true && a.hour >= 12 %>
                <% b = a.to_date + 4 %>
              <% elsif a.friday? == true && a.hour < 12 %>
                <% b = a.to_date + 3 %>
              <% elsif a.friday? == true && a.hour >= 12 %>
                <% b = a.to_date + 4 %>
              <% elsif a.saturday? == true && a.hour < 12 %>
                <% b = a.to_date + 3 %>
              <% elsif a.saturday? == true && a.hour >= 12 %>
                <% b = a.to_date + 3 %>
              <% elsif a.sunday? == true && a.hour < 12 %>
                <% b = a.to_date + 2 %>
              <% elsif a.sunday? == true && a.hour >= 12 %>
                <% b = a.to_date + 2 %>
              <% end %>

            <% elsif @c == 'backordered' %>

              <% if a.monday? == true && a.hour < 12 %>
                <% b = a.to_date + 10 %>
              <% elsif a.monday? == true && a.hour >= 12 %>
                <% b = a.to_date + 10 %>
              <% elsif a.tuesday? == true && a.hour < 12 %>
                <% b = a.to_date + 9 %>
              <% elsif a.tuesday? == true && a.hour >= 12 %>
                <% b = a.to_date + 16 %>
              <% elsif a.wednesday? == true && a.hour < 12 %>
                <% b = a.to_date + 15 %>
              <% elsif a.wednesday? == true && a.hour >= 12 %>
                <% b = a.to_date + 15 %>
              <% elsif a.thursday? == true && a.hour < 12 %>
                <% b = a.to_date + 14 %>
              <% elsif a.thursday? == true && a.hour >= 12 %>
                <% b = a.to_date + 14 %>
              <% elsif a.friday? == true && a.hour < 12 %>
                <% b = a.to_date + 13 %>
              <% elsif a.friday? == true && a.hour >= 12 %>
                <% b = a.to_date + 13 %>
              <% elsif a.saturday? == true && a.hour < 12 %>
                <% b = a.to_date + 12 %>
              <% elsif a.saturday? == true && a.hour >= 12 %>
                <% b = a.to_date + 12 %>
              <% elsif a.sunday? == true && a.hour < 12 %>
                <% b = a.to_date + 11 %>
              <% elsif a.sunday? == true && a.hour >= 12 %>
                <% b = a.to_date + 11 %>
              <% end %>

            <% end %>

            <%= b %>

          </span>
        </label>
      </li>
    </ul>
    ")
