class ApplicationController < ActionController::Base
    before_action :authenticate_user!, :configure_permitted_parameters, if: :devise_controller?
    before_action :current_user
  
    private
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    end

    def after_sign_in_path_for(resource)
        categories_path
    end
end
