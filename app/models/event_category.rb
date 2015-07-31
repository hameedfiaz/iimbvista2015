class EventCategory < ActiveRecord::Base
	default_scope where(:active => true)

  attr_accessible :title, :description, :active

  has_many :events
  has_and_belongs_to_many :users
end
