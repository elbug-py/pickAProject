class ApplicationController < ActionController::Base
    before_action :authenticate_user!

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
        devise_parameter_sanitizer.permit(:account_update, keys: [:password])
    end

    def after_sign_in_path_for(resource)
        root_path
    end

end
