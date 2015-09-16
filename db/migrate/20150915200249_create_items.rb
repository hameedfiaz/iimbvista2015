class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :sku
      t.integer :product_id
      t.decimal :price, :precision=>8, :scale=>2
      t.string :item_desc

      t.timestamps
    end
  end
end
