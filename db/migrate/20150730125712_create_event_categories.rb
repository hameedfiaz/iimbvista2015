class CreateEventCategories < ActiveRecord::Migration
  def change
    create_table :event_categories do |t|
      t.string :title
      t.text :description
      t.boolean :active, :default => true

      t.timestamps
    end
  end
end
