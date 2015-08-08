class EventTab < ActiveRecord::Base
	default_scope where(:active => true)

  attr_accessible :title, :description, :active, :rank, :event_id, :show_after_registration

  belongs_to :event
end
