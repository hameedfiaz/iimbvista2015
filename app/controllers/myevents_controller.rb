class MyeventsController < ApplicationController

	layout "myevents"
	def home
		@event_categories=EventCategory.all
		@events=Event.order(:title)
	end

	def information
		event_id=params[:id]
		if !!(event_id =~ /\A[-+]?[0-9]+\z/) 
			@event=Event.find(event_id)
			@user_registered=@event.user_registered?(current_user)
		end
	end
end
