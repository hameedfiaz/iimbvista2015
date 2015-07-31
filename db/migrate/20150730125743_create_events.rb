class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :event_category_id
      t.string :title
      t.text :description
      t.boolean :online_registration, :default => true
      t.boolean :active, :default => true

      t.timestamps
    end
  end
end
