class RegistrationsController < Devise::RegistrationsController

    
    def update

      # Skip the current password requirement
      resource.update_without_password(resource_params)
      if successfully_updated?(resource)
        set_flash_message :notice, :updated
        redirect_to profile_path
      else
        clean_up_passwords resource
        set_minimum_password_length
        respond_with resource
      end
    end
  
    private
  
    def resource_params
      params.require(:user).permit(:email, :name, :last_name, :profile_state)
    end
  
    def successfully_updated?(resource)
      resource.errors.empty?
    end
  
    def after_update_path_for(resource)
      profile_path
    end
  end
  