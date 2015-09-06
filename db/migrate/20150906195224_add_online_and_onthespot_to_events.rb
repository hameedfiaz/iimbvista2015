class AddOnlineAndOnthespotToEvents < ActiveRecord::Migration
  def change
  	add_column :events, :online_event, :boolean, :default => false
  	add_column :events, :on_the_spot_event, :boolean, :default => false
  end
end
