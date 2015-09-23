class Cart < ActiveRecord::Base

	attr_accessible :user_id

	belongs_to :user
	has_and_belongs_to_many :items

	def to_order
		order=Order.new
		order.user_id=user_id
		if items.present?
			total_amount=items.collect(&:price).inject(:+)
		else
			total_amount=0
		end
		order.cart_amount=total_amount
		order.save!
		item_groups = items.group_by(&:id)
		item_groups.each do |k,v|
			item=v.first
			quantity=v.size
			order_item=OrderItem.new
			order_item.order_id=order.id
			order_item.item_id=item.id
			order_item.quantity=quantity
			order_item.save!
		end
	end
end
