class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :name, null: false
      t.text :description
      t.references :delivery_methods
      t.string :picture_url
      t.integer :offer_price, null: false
      t.integer :quantity, default: 1, null: false
      t.integer :status, default: 0, null: false
      t.integer :requester_id, null: false
      t.timestamps null: false

      t.integer :selling_location_id, null: false
      t.integer :delivery_location_id, null: false

      t.index :name
      t.index :description

      t.foreign_key :locations, column: :selling_location_id
      t.foreign_key :locations, column: :delivery_location_id
      t.foreign_key :users, column: :requester_id
    end
  end
end
