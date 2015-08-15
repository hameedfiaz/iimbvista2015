class ApplicationController < ActionController::Base
	protect_from_forgery

  before_filter :check_if_devise
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

  def check_if_devise
    if ['devise/registrations','confirmations', 'omniauth_callbacks', 'passwords', 'registrations', 'sessions', 'unlocks'].include? params[:controller]
      sanitize_college_data
    end
  end

  def sanitize_college_data
    user_param=params[:user]
    debugger
    if user_param[:college_id].to_i==0
      new_college=user_param[:new_college_name]
      new_college=College.create({name: new_college})
      user_param[:college_id]=new_college.id
    end
    user_param.delete("new_college_name")
    params[:user]=user_param
  end

end
