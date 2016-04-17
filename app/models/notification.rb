class Notification < ActiveRecord::Base
  def self.user_inbox(user)
    Notification.where(receiver_id: user.id)
  end
end