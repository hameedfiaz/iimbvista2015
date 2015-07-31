class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :full_name
      t.boolean :active, :default => true

      t.timestamps
    end
  end
end
