class AddDefaultAvatarToUsers < ActiveRecord::Migration
  def change
    change_column_default :users, :avatar, "http://ssl.gstatic.com/accounts/ui/avatar_2x.png"
  end
end
