class ChangeReview < ActiveRecord::Migration
  def change
    change_table :reviews do |t|
      t.integer :offer_id
      t.integer :request_id
    end
  end
end
