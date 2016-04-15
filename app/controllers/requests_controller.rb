class RequestsController < ApplicationController
  def index
    @requests = current_user.requests
  end

  def show
  end
end
