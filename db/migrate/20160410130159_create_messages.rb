class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :user, null: false, index: true, foreign_key: true
      t.references :request, null: false, index: true, foreign_key: true
      t.string :content, null: false

      t.timestamps null: false
    end
  end
end
