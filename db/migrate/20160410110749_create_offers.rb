class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.integer :carrier_id, null: false
      t.integer :price, null: false
      t.date :arrival_date, null: false
      t.references :request, null: false
      t.integer :status, default: 0, null: false
      t.timestamps null: false
    end

    change_table :requests do |t|
      t.integer :selected_offer_id
      add_foreign_key :requests, :offers, column: :selected_offer_id
    end
  end
end
