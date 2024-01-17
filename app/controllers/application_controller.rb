class ApplicationController < ActionController::Base

  before_action :authenticate_user!


    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:firstname, :lastname, :address, :contact_number])  
    end




    # role picture
    private

    def after_sign_in_path_for(resource)
      if resource.role == 'admin'  # Replace with your admin model name if different
        main_display_path  # Redirect to admin dashboard path after admin signs in
        # Redirect to user dashboard path after user signs in # Fallback to default behavior for other resources
      
      else
        root_path
      end
    end

    # def after_sign_in_path_for(resource)
    #     if resource.admin?  # Check if the signed-in user has an 'admin' role
    #       main_display_path  # Redirect to admin dashboard path after admin signs in
    #     elsif resource.user?  # Check if the signed-in user has a 'user' role
    #       root_path   # Redirect to user dashboard path after user signs in
    #     else
    #       super  # Fallback to default behavior for other roles or conditions
    #     end
    #   end
end
