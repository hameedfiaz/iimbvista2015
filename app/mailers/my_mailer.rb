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

  def shop_at_vista_success(user,order)
    @order=order
    @user=user
    attachments.inline['header.png'] = File.read("#{Rails.root}/app/assets/images/img/mail_header.png")
    mail(:from => "vista@iimb.ernet.in", :to => user.email, :subject => "Thank you for Shopping at Vista 2015 ! ")
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
    attachments.inline['tree_pic.jpg'] = File.read("#{Rails.root}/public/tree_pic.jpg")
    attachments.inline['vikasana.jpg'] = File.read("#{Rails.root}/public/vikasana.jpg")
    mail(:from => "vista@iimb.ernet.in", :to => email, :subject => "Make a Wish Tree @ Vista 2015")
  end

  def launch_mailer_third(email)
    # attachments.inline['footer.png'] = File.read("#{Rails.root}/app/assets/images/img/mail_footer.png")
    attachments.inline['header.png'] = File.read("#{Rails.root}/app/assets/images/img/mail_header.png")
    mail(:from => "vista@iimb.ernet.in", :to => email, :subject => "IIM Bangalore's VISTA| IIM B Annual Business Summit | 24th to 27th September 2015")
  end

  def feedback_mailer(email)
    attachments.inline['iimb_mailer.jpg'] = File.read("#{Rails.root}/app/assets/images/img/iimb_mailer.jpg")
    attachments.inline['fii_mailer.jpg'] = File.read("#{Rails.root}/app/assets/images/img/fii_mailer.jpg")
    attachments.inline['speaker1.jpg'] = File.read("#{Rails.root}/app/assets/images/img/speaker1.jpg")
    attachments.inline['speaker2.jpg'] = File.read("#{Rails.root}/app/assets/images/img/speaker2.jpg")
    attachments.inline['speaker3.jpg'] = File.read("#{Rails.root}/app/assets/images/img/speaker3.jpg")
    attachments.inline['speaker4.jpg'] = File.read("#{Rails.root}/app/assets/images/img/speaker4.jpg")
    attachments.inline['speaker5.jpg'] = File.read("#{Rails.root}/app/assets/images/img/speaker5.jpg")
    mail(:from => "colloquium@iimb.ernet.in", :to => email, :subject => "IIM Bangalore | Colloquium Unleashed | 5 speakers, 5 inspirational talks!")
  end

  def certi_mailer(email,i)
    attachments.inline['header.png'] = File.read("#{Rails.root}/app/assets/images/img/mail_header.png")
    attachments["YLS_Certificate.pdf"] = File.read("#{Rails.root}/lib/tasks/certificates/Certificate of Achievement.#{i.to_s}.pdf")
    mail(:from => "vista@iimb.ernet.in", :to => email, :subject => "IIM Bangalore's Vista: Young Leaders Summit Certificates")
  end

end