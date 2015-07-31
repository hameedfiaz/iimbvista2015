class CreateEventTabs < ActiveRecord::Migration
  def change
    create_table :event_tabs do |t|
      t.integer :event_id
      t.string :title
      t.text :description
      t.boolean :active, :default => true
      t.integer :rank, :default => 0

      t.timestamps
    end
  end
end
