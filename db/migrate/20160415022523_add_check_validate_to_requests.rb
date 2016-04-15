class AddCheckValidateToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :check_validate, :boolean, default: true
  end
end
