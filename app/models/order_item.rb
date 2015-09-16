class OrderItem < ActiveRecord::Base

	attr_accessible :order_id, :item_id, :quantity

	belongs_to :order
end
