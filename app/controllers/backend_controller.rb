class BackendController < ApplicationController

	before_filter :authorize, :only => [:index]
	def authorize
		if current_user && (current_user.is_super_admin? || current_user.is_category_admin? || current_user.is_bulletin_admin? )
			true
		else
			redirect_to root_path
		end
	end

	def index
		if current_user.is_super_admin?
			redirect_to event_categories_path
		elsif current_user.is_bulletin_admin?
			redirect_to bulletins_path
		else
			redirect_to events_path
		end
	end
end
