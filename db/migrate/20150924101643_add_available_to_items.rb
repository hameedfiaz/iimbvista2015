class AddAvailableToItems < ActiveRecord::Migration
  def change
    add_column :items, :available, :integer, :default=>0

  end
end
