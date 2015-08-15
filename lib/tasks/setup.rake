require 'csv'

namespace :setup do
  desc "TODO"
  task :feed_college_list => :environment do
  	begin 
  		filename="#{Rails.root}/lib/tasks/college_list.csv"
  		if File.exist?(filename)
  			CSV.foreach(filename, :headers => false) do |row|
  				coll=College.create({name: row.first.to_s})
  				puts "Created #{coll.name} with id #{coll.id}"
       end
     else
       puts "Collge List not found at /lib/college_list.csv"
     end
   rescue Exception => ex
    puts ex.message
  end
end

end
