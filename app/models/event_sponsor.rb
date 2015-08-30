class EventSponsor < ActiveRecord::Base

	attr_accessible :file_name, :event_id, :link_url, :rank

	belongs_to :event
end
