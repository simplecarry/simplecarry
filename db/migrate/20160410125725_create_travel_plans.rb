class CreateTravelPlans < ActiveRecord::Migration
  def change
    create_table :travel_plans do |t|
      t.references :user, index: true, foreign_key: true
      t.string :country, null: false
      t.datetime :return_date, null: false

      t.timestamps null: false
    end
  end
end
