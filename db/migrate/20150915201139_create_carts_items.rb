class CreateCartsItems < ActiveRecord::Migration
  def self.up
		create_table :carts_items, :id => false do |t|
			t.references :cart, :item
		end
	end
	
	def self.down
		drop_table :carts_items
	end
end
