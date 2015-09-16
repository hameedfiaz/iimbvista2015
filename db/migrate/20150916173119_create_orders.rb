class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.decimal :total_amount, :precision => 8, :scale => 2

      t.timestamps
    end
  end
end
