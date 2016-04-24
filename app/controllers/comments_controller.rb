class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.new(comment_params)
    @request = Request.find params[:comment][:request_id]
    if @comment.save
      respond_to do |format|
        format.js {
          flash[:success] = "Your comment is created"
        }
        format.html {
          flash[:success] = "Your comment is created"
          redirect_to request_path(@request)
        }
      end
    else
      respond_to do |format|
        format.js {
          flash[:error] = "Your comment is too short (minimum is 5 characters)"
        }
        format.html {
          flash[:error] = "Your comment is too short (minimum is 5 characters)"
          redirect_to request_path(@request)
        }
      end
    end
  end
  private
    def comment_params
      params.require(:comment).permit(:content, :request_id)
    end
end
