class MyMailer < Devise::Mailer
  default :from => 'vista@iimb.ernet.in'   
  helper :application # gives access to all helpers defined within `application_helper`.
  include Devise::Controllers::UrlHelpers # Optional. eg. `confirmation_url`
  default template_path: 'devise/mailer' # to make sure that your mailer uses the devise views

  def thank_you(user)
    @user=user
    attachments.inline['footer.png'] = File.read("#{Rails.root}/app/assets/images/img/mail_footer.png")
    attachments.inline['header.png'] = File.read("#{Rails.root}/app/assets/images/img/mail_header.png")
  	mail(:from => "vista@iimb.ernet.in", :to => user.email, :subject => "Vista2015 Registration Success")
  end

  def referral_mail(user)
  	@resource=user
    attachments.inline['footer.png'] = File.read("#{Rails.root}/app/assets/images/img/mail_footer.png")
    attachments.inline['header.png'] = File.read("#{Rails.root}/app/assets/images/img/mail_header.png")
  	mail(:from => "vista@iimb.ernet.in", :to => user.email, :subject => "Welcome 2 Vista2015 ! ")
  end

  def event_registration_mail(user,team,event)
    @user=user
    @team_name=team.name
    @event_title=event.title
    attachments.inline['footer.png'] = File.read("#{Rails.root}/app/assets/images/img/mail_footer.png")
    attachments.inline['header.png'] = File.read("#{Rails.root}/app/assets/images/img/mail_header.png")
    mail(:from => "vista@iimb.ernet.in", :to => user.email, :subject => "Vista2015 Event Registration Successful")
  end

  def launch_announcement_mail(email)
    attachments.inline['footer.png'] = File.read("#{Rails.root}/app/assets/images/img/mail_footer.png")
    attachments.inline['header.png'] = File.read("#{Rails.root}/app/assets/images/img/mail_header.png")
    mail(:from => "vista@iimb.ernet.in", :to => email, :subject => "IIM Bangalore's Vista's - Registrations are now open!")
  end

  def launch_mailer_second(email)
    # attachments.inline['footer.png'] = File.read("#{Rails.root}/app/assets/images/img/mail_footer.png")
    attachments.inline['header.png'] = File.read("#{Rails.root}/app/assets/images/img/mail_header.png")
    mail(:from => "vista@iimb.ernet.in", :to => email, :subject => "IIMB Bangalore's VISTA: Deadline update")
  end
end