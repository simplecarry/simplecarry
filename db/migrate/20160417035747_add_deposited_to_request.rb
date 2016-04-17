class AddDepositedToRequest < ActiveRecord::Migration
  def change
    change_table :requests do |t|
      t.boolean :has_deposited, default: false
    end
  end
end
