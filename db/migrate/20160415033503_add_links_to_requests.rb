class AddLinksToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :links, :string
  end
end
