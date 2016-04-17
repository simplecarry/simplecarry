class AddReview < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :score, default: 1
      t.integer :reviewer_id
      t.integer :reviewee_id
      t.timestamps

      t.index :reviewer_id
      t.index :reviewee_id

      t.foreign_key :users, column: :reviewer_id
      t.foreign_key :users, column: :reviewee_id
    end

    change_table :users do |t|
      t.integer :current_score, default: 0
    end
  end
end
