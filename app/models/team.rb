class Team < ActiveRecord::Base
  attr_accessible :event_id, :name

  has_and_belongs_to_many :users
  belongs_to :event

  def send_event_reg_mails
  	users.each do |user|
  		MyMailer.delay.event_registration_mail(user,self,event)
  	end
  end
end
