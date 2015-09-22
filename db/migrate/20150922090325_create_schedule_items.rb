class CreateScheduleItems < ActiveRecord::Migration
  def change
    create_table :schedule_items do |t|
      t.string :description
      t.datetime :event_start
      t.datetime :event_end
      t.string :venue

      t.timestamps
    end
  end
end
