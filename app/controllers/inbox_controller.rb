class InboxController < ApplicationController
  def show
    if params['filter-by']
      @messages = Notification.user_inbox(current_user, Request.statuses[params['filter-by']])
    else
      @messages = Notification.user_inbox(current_user)
    end
  end
end