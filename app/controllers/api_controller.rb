class ApiController < ApplicationController

  def auth_user
  	email=params[:email]
  	password=params[:password]
  	begin
  		user=User.find_by_email(email)
  		if user
  			res = user.valid_password?(password)
  		end
  	rescue
  		render :text => "Oops ! Something went wrong", :status => 503 and return
  	end
  	if res
  		render :text => "Sucess" and return
  	else
  		render :text => "Authentication Failed", :status => 500 and return
  	end
  end

end
