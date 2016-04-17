class InboxController < ApplicationController
  def show
    @messages = Notification.user_inbox(current_user)
  end
end