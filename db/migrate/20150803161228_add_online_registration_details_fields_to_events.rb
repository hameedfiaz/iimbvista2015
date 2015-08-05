class AddOnlineRegistrationDetailsFieldsToEvents < ActiveRecord::Migration
  def change
  	add_column :events, :per_team, :integer, :default => 0
  	add_column :events, :permitted_registrations, :integer, :default => 0
  	add_column :events, :registration_fee, :integer, :default => 0
  	add_column :events, :flagship, :boolean, :default => false
  end
end
