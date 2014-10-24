module Spree
  BaseHelper.module_eval do
    def in_registration_step?
      return true if controller_name == 'checkout'      and action_name == 'registration'
      return true if controller_name == 'checkout'      and action_name == 'update_registration'
      return true if controller_name == 'user_sessions' and action_name == 'create'

      return false
    end
  end
end
