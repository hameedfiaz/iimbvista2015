class UsersHaveAndBelongToManyTeams < ActiveRecord::Migration
	def up
		create_table :teams_users, :id => false do |t|
			t.references :team, :user
		end
	end

	def down
		drop_table :teams_users
	end
end
