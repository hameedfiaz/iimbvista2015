class BackendController < ApplicationController

	before_filter :authorize
	def authorize
		if current_user && (current_user.is_super_admin? || current_user.is_category_admin?)
			true
		else
			redirect_to root_path
		end
	end

	def index
		if current_user.is_super_admin?
			redirect_to event_categories_path
		else
			redirect_to events_path
		end
	end

	def myevents
		# If params fetch the data using the category id
		# else fetch events associated to the users category
		if (cat_id=params[:id] && current_user.is_super_admin?)
			@event_cat=EventCategory.find_by_id(cat_id)
		else
			@event_cat=current_user.event_category
		end
		if @event_cat
			@events=@event_cat.events
		end
	end

	def event
		if(event_id=params[:id])
			@event_tabs=Event.find_by_id(event_id).event_tabs
		end
		# fetch the data using the event id
	end

	def event_tab
		event_tab_id=params[:id]
		@event_tab = EventTab.find_by_id(event_tab_id)
		# fetch the data using the event tab id
	end
end
