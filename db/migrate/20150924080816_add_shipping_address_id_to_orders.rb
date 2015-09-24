class AddShippingAddressIdToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :address, :text
  end
end
