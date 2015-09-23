class Cart < ActiveRecord::Base

	attr_accessible :user_id

	belongs_to :user
	has_and_belongs_to_many :items

	def to_order
		order=Order.new
		order.user_id=user_id
		if items.present?
			number_of_items=items.count
			offer=(200*(number_of_items/3))
			offer+=(number_of_items%3==2 ? 100 : 0 )
			total_amount=items.collect(&:price).inject(:+)
			total_amount_with_offer=total_amount-offer
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
		order
	end

	def offer_amount
		if items.present?
			number_of_items=items.count
			offer=(200*(number_of_items/3))
			offer+=(number_of_items%3==2 ? 100 : 0 )
		else
			offer=0
		end
		offer
	end

	def final_amount
		final_amount = items.collect(&:price).inject(:+).round(2)-offer_amount
		final_amount>0 ? final_amount : 0
	end
end
