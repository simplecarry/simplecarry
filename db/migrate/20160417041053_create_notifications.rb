class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :type
      t.text :content
      t.integer :receiver_id
      t.integer :sender_id
      t.timestamps

      t.index :type
      t.index :sender_id
      t.index :receiver_id

      t.foreign_key :users, :column => :receiver_id
      t.foreign_key :users, :column => :sender_id
    end
  end
end
