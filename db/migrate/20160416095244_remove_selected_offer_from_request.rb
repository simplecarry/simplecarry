class RemoveSelectedOfferFromRequest < ActiveRecord::Migration
  def change
    change_table :requests do |t|
      t.remove :selected_offer_id
    end
  end
end
