class Event < ActiveRecord::Base
	default_scope where(:active => true)

  attr_accessible :title, :description, :online_registration, :active, :event_category_id, :max_per_team, :min_per_team, :deadline, :permitted_registrations, :registration_fee, :flagship

  has_many :event_tabs
  has_many :teams
  has_many :event_sponsors
  belongs_to :event_category

  def online_registration?
  	online_registration
  end

  def registrations_open?
  	online_registration && within_deadline? && (permitted_registrations==0 || teams_registered < permitted_registrations)
  end

  def registrations_closed?
  	!registration_open
  end

  def user_registered?(current_user)
    teams.collect(&:users).flatten.uniq.include? current_user
  end

  def within_deadline?
    if deadline
      deadline > Time.now.to_date
    end
    true
  end

  def teams_registered
  	Team.where(event_id: id).count
  end

  def sorted_event_sponsors
    event_sponsors.order(rank: :asc)
  end

  def title_description
    description.html_safe.gsub("<p>","").gsub("</p>","")
  end
end
