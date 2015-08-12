class CreateBulletins < ActiveRecord::Migration
  def change
    create_table :bulletins do |t|
      t.string :text
      t.boolean :link
      t.string :link_url

      t.timestamps
    end
  end
end
