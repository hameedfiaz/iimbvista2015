class AddOrderIdToOrders < ActiveRecord::Migration
  def change
  	add_column :orders, :order_id, :string
  	add_column :orders, :cart_amount, :decimal, :precision => 8, :scale => 2
  end
end
