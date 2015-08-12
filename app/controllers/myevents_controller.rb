class MyeventsController < ApplicationController

	layout "myevents"
	def home
		@event_categories=EventCategory.all
		@events=Event.order(:title)
		@bulletins=Bulletin.order(created_at: :desc).limit(5)
	end

	def information
		event_id=params[:id]
		if !!(event_id =~ /\A[-+]?[0-9]+\z/) 
			@event=Event.find(event_id)
			@user_registered=@event.user_registered?(current_user)
			@bulletins=Bulletin.order(created_at: :desc).limit(5)
		end
	end
end
