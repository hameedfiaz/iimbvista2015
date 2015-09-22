class Order < ActiveRecord::Base

	attr_accessible :user_id, :total_amount, :created_at, :updated_at

	belongs_to :user
	has_many :order_items
end
