class RemoveCountryFromTravelPlans < ActiveRecord::Migration
  def change
    remove_column :travel_plans, :country, :string
  end
end
