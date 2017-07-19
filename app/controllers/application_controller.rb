class ApplicationController < ActionController::Base
	  protect_from_forgery with: :exception
	  before_action :configure_permitted_parameters, if: :devise_controller?

		def configure_permitted_parameters
		 devise_parameter_sanitizer.permit(:login, keys: [:provider, :uid, :image_url, :name, :email, :password, :remember_me])
		 devise_parameter_sanitizer.permit(:sign_up) do |u|
		   u.permit(:provider, :uid, :image_url, :name, :email, :password, :remember_me)
		  end
		  devise_parameter_sanitizer.permit(:edit) do |u|
		    u.permit(:provider, :uid, :image_url, :name, :email, :password, :remember_me)
		 end
		end

  
end
