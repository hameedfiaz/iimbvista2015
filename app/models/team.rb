class Team < ActiveRecord::Base
  attr_accessible :event_id, :name

  has_and_belongs_to_many :users
  belongs_to :event
end
