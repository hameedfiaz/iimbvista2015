class Event < ActiveRecord::Base
	default_scope where(:active => true)

  attr_accessible :title, :description, :online_registration, :active, :event_category_id

  has_many :event_tabs
  belongs_to :event_category
end
