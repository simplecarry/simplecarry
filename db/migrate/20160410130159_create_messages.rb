class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :user, index: true, foreign_key: true
      t.references :request, index: true, foreign_key: true
      t.string :content, null: false

      t.timestamps null: false
    end
  end
end
