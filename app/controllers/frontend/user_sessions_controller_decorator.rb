module Spree
  UserSessionsController.class_eval do
    def create
      authenticate_spree_user!

      if spree_user_signed_in?
        respond_to do |format|
          format.html {
            flash[:success] = Spree.t(:logged_in_succesfully)
            redirect_back_or_default(after_sign_in_path_for(spree_current_user))
          }
          format.js {
            render :json => {:user => spree_current_user,
                             :ship_address => spree_current_user.ship_address,
                             :bill_address => spree_current_user.bill_address}.to_json
          }
        end
      else
        respond_to do |format|
          format.html {
            flash.now[:error] = t('devise.failure.invalid')

            if params[:checkout] == 'true'
              @order = current_order
              # To get addresses in one step checkout
              @order.bill_address ||= Address.build_default
              @order.ship_address ||= Address.build_default if @order.checkout_steps.include?('delivery')

              render 'spree/checkout/registration'
            else
              render :new
            end
          }
          format.js {
            render :json => { error: t('devise.failure.invalid') }, status: :unprocessable_entity
          }
        end
      end
    end
  end
end