class HomeController < ApplicationController
  def index
    @requests = Request.all
    
    if(params[:search])
      @requests = Request.search(params[:search])
    end
  end
end
