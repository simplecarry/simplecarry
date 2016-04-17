class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.new(comment_params)
    @request = Request.find_by_id(params[:comment][:request_id])
    if @comment.save
      flash[:success] = "Your comment create finish"
      redirect_to request_path(@request)
    else
      flash[:error] = "Your comment too short (minimum is 5 character)"
      redirect_to request_path(@request)
    end
  end
  private
    def comment_params
      params.require(:comment).permit(:content, :request_id)
    end
end
