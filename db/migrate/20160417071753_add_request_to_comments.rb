class AddRequestToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :request, index: true, foreign_key: true
  end
end
