class DashboardController < ApplicationController

	before_filter :check_permission

  def check_permission
  	redirect_to root_path unless (user_signed_in? && current_user && current_user.roles!=[])
  end

  def index
  	user_ids = User.valid_users.collect(&:id)
  	valid_users=User.where(:id => user_ids)
  	@total_count = valid_users.count
  	@college_count = valid_users.group(:college_id).count

  	@events = Event.unscoped
  	@team_count = Team.group(:event_id).count
  end

  def event_registrations
  	event_id=params[:id]
  	@event=Event.unscoped.find_by_id(event_id)
  	@registrations_count=@event.teams.collect(&:users).count
  end
end
