class EventTab < ActiveRecord::Base
	default_scope where(:active => true)

  attr_accessible :title, :description, :active, :rank, :event_id

  belongs_to :event
end
