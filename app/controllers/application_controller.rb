class ApplicationController < ActionController::Base
	protect_from_forgery

	after_filter :store_location

	def store_location
  		# store last url - this is needed for post-login redirect to whatever the user last visited.
  		return unless request.get? 
  		if (request.path != "/users/sign_in" &&
  		request.path != "/users/sign_up" &&
  		request.path != "/users/password/new" &&
  		request.path != "/users/password/edit" &&
  		request.path != "/users/confirmation" &&
  		request.path != "/users/sign_out" &&
      	!request.xhr?) # don't store ajax calls
  			session[:previous_url] = request.fullpath 
		end
	end

	def after_sign_in_path_for(resource)
		if user_signed_in? && (current_user.is_super_admin? || current_user.is_category_admin? || current_user.is_bulletin_admin? )
      backend_index_path
    else
      session[:previous_url] || root_path
    end
	end

end
