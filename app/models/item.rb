class Item < ActiveRecord::Base

	attr_accessible :sku, :product_id, :price, :item_desc

	belongs_to :product
	has_and_belongs_to_many :carts
end
