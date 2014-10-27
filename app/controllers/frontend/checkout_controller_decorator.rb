module Spree
  CheckoutController.class_eval do
    before_filter :check_logged_in_user, :only => [:registration, :update_registration]

    private
      def check_logged_in_user
        # Skip the login step if user already logged in
        redirect_to spree.checkout_path if current_spree_user or current_order.email.present?

        # Skip the login step if not enabled
        redirect_to spree.checkout_path unless Spree::Auth::Config[:registration_step]
      end
  end
end
