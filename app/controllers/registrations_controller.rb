class RegistrationsController < ApplicationController
  def register
  	@message=""
  	event_id=params[:event_id]
  	event=Event.find_by_id(event_id)
  	team_list=[]
  	registrations=params[:register]
  	team_name=params[:team_name]
  	registrations.each do |k,v|
  		if v[:email].present? && v[:phone].present?
  			user=User.find_or_create_by_email(v[:email])
  			if user.new_record?
  				user.update_attribute(:full_name, v[:email])
  				user.update_attribute(:phone, v[:phone])
  				user.password="welcome@123"
  				user.password_confirmation="welcome@123"
  				user.save!
  			end
  			user.reload
  			team_list<<user
  		end
  	end
 	check_team=Team.find_by_name(team_name)
 	if check_team
 		@message="Same Team name already exists"
 	elsif team_list.count >= event.min_per_team
  		team=Team.create({event_id: event.id, name: team_name})
  		team.users=team_list
  		team.save!
  	else
  		@message="Did not meet the minimum criteria"
  	end

  end
end
