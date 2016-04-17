class AddEventTypeToNotification < ActiveRecord::Migration
  def change
    change_table :notifications do |t|
      t.integer :event_type
    end
  end
end
