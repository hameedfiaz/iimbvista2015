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

	task :send_second_mail => :environment do
		begin
			users=User.all.collect(&:email) 
			# filename="#{Rails.root}/lib/tasks/launch_email_list.csv"
			# if File.exist?(filename)
				# CSV.foreach(filename, :headers => false) do |row|
					users.each_with_index do |email_id,ind|
						puts "Sending mail to #{email_id}"
						MyMailer.delay.feedback_mailer(email_id)
						puts "Queued mail sending *******************#{ind}"
					end
				# end
			# else
				# puts "Email List not found at /lib/launch_email_list.csv"
			# end
		rescue Exception => ex
			puts ex.message
		end

	end

	task :send_to_list_in_csv => :environment do |task,args|
		begin
			filename="#{Rails.root}/lib/tasks/yls_email_list.csv"
	  		if File.exist?(filename)
	  			CSV.foreach(filename, :headers => true) do |row|
	  				if row[4].present?
		  					puts "Sending mail to #{row[4]}"
		  					MyMailer.delay.launch_mailer_second(row[4])
							puts "Queued mail sending *******************#{$.}"
	  				end
	       		end
	     	else
	       		puts "Collge List not found at /lib/tasks/email_list.csv"
	     	end
		rescue Exception => e
			puts e.message
		end
	end

	task :send_feedback_mail => :environment do
		begin 
			filename="#{Rails.root}/lib/tasks/feedback_file.csv"
			if File.exist?(filename)
				CSV.foreach(filename, :headers => false) do |row|
					row.each_with_index do |email_id,ind|
						puts "Sending mail to #{email_id}"
						MyMailer.delay.feedback_mailer(email_id)
						puts "Queued mail sending *******************#{ind}"
					end
				end
			else
				puts "Email List not found at /lib/feedback_file.csv"
			end
		rescue Exception => ex
			puts ex.message
		end

	end

end
