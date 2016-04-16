class AddCheckValidateToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :check_validate, :string, default: ""
  end
end
