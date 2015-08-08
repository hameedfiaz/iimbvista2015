class AddShowAfterRegistrationToEventTabs < ActiveRecord::Migration
  def change
  	add_column :event_tabs, :show_after_registration, :boolean, :default => false
  end
end
