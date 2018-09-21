# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
   before_action :configure_sign_in_params, only: [:create]
  protect_from_forgery with: :null_session, :if => Proc.new { |c| c.request.format == 'application/json' }
  # GET /resource/sign_in
   def new

	self.resource = resource_class.new(sign_in_params)
    clean_up_passwords(resource)
    yield resource if block_given?
		respond_with(resource, serialize_options(resource))

   end

  # POST /resource/sign_in
   def create
    self.resource = warden.authenticate!(auth_options)

    set_flash_message!(:notice, :signed_in)
    sign_in(resource_name, resource)
    yield resource if block_given?
	#respond_with resource, location: after_sign_in_path_for(resource)

	   respond_to do |format|
			    format.html { respond_with resource,  location: after_sign_in_path_for(resource) }

				 format.json {
					   render :json => {
						 :user => current_user,
						 :status => :ok,

					   }
					}
	   end
   end



   # DELETE /resource/sign_out
  def destroy
		  

    signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
    set_flash_message! :notice, :signed_out if signed_out


   respond_to do |format|
     format.json {
       if current_user
         current_user.update authentication_token: nil
         render :json => {}.to_json, :status => :ok
       else
         render :json => {}.to_json, :status => :unprocessable_entity
       end
    }
    format.html { respond_to_on_destroy }
   end
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
   def configure_sign_in_params
     devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
   end
end
