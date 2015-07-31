class UsersHaveAndBelongToManyEventCategories < ActiveRecord::Migration
	def self.up
		create_table :event_categories_users, :id => false do |t|
			t.references :event_category, :user
		end
	end
	
	def self.down
		drop_table :event_categories_users
	end
end
