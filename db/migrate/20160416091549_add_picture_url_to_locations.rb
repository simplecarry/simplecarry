class AddPictureUrlToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :picture_url, :string
  end
end
