class CreateEventSponsors < ActiveRecord::Migration
  def change
    create_table :event_sponsors do |t|
      t.string :file_name
      t.integer :event_id
      t.string :link_url
      t.integer :rank

      t.timestamps
    end
  end
end
