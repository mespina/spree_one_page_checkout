Deface::Override.new :virtual_path => 'spree/shared/_login',
                     :name => 'add_extra_param_to_login_form',
                     :insert_before => "#password-credentials",
                     :text => "<input type='hidden' name='checkout' value='<%= @order.present? %>'>"
