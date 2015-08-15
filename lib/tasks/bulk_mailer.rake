namespace :bulk_mailer do
	desc "TODO"
	task :send_mail => :environment do
		begin 
			filename="#{Rails.root}/lib/tasks/launch_email_list.csv"
			if File.exist?(filename)
				CSV.foreach(filename, :headers => false) do |row|
					row.each_with_index do |email_id,ind|
						puts "Sending mail to #{email_id}"
						MyMailer.delay.launch_announcement_mail(email_id)
						puts "Queued mail sending *******************#{ind}"
					end
				end
			else
				puts "Email List not found at /lib/launch_email_list.csv"
			end
		rescue Exception => ex
			puts ex.message
		end

	end
end
