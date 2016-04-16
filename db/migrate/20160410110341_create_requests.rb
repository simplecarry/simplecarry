class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :name, null: false
      t.text :description
      t.references :delivery_method
      t.string :picture_url
      t.integer :offer_price
      t.integer :quantity, default: 1
      t.integer :status, default: 0
      t.integer :requester_id
      t.timestamps null: false

      t.integer :selling_location_id
      t.integer :delivery_location_id

      t.index :name
      t.index :description

      t.foreign_key :locations, column: :selling_location_id
      t.foreign_key :locations, column: :delivery_location_id
      t.foreign_key :users, column: :requester_id
    end
  end
end
