class MyeventsController < ApplicationController

	layout "myevents"
	def home
		@event_categories=EventCategory.all
		@events=Event.all
	end

	def information
		event_id=params[:id]
		if !!(event_id =~ /\A[-+]?[0-9]+\z/) 
			@event=Event.find(event_id)
		end
	end
end
