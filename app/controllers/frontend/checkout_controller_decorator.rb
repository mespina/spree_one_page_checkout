module Spree
  CheckoutController.class_eval do
    before_filter :check_logged_in_user, :only => [:registration, :update_registration]

    private
      def check_logged_in_user
        redirect_to spree.checkout_path if current_spree_user
      end
  end
end