class Notification < ActiveRecord::Base
  def self.user_inbox(user, event_type = nil)
    query = Notification.where(receiver_id: user.id).order('created_at DESC')
    if event_type
      query = query.where(event_type: event_type)
    end
    query
  end
end