class AddLocationRefToTravelPlans < ActiveRecord::Migration
  def change
    add_reference :travel_plans, :location, index: true, foreign_key: true
  end
end
