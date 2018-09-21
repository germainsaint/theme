class ApplicationController < ActionController::Base
 ## protect_from_forgery with: :exception
  #before_action :authenticate_user!
	before_action :store_user_location!, if: :storable_location?
  protect_from_forgery with: :null_session, :if => Proc.new { |c| c.request.format == 'application/json' }

 private
    # Its important that the location is NOT stored if:
    # - The request method is not GET (non idempotent)
    # - The request is handled by a Devise controller such as Devise::SessionsController as that could cause an
    #    infinite redirect loop.
    # - The request is an Ajax request as this can lead to very unexpected behaviour.
    def storable_location?
      request.get? && is_navigational_format? && !devise_controller? && !request.xhr?
    end

    def store_user_location!
      # :user is the scope we are authenticating
      store_location_for(:user, request.fullpath)
    end

		 def after_sign_in_path_for(resource)
    	  sign_in_url = new_user_session_url

			if request.referer == sign_in_url
						  resource
				else
			#   stored_location_for(resource) || request.referer || root_path

				#admin_users_path
				 if resource.has_role?(:admin)
			 		admin_dashboard_path
				 else resource.has_role?(:member)
					user_path(resource)
				 end
			end
		end
end
