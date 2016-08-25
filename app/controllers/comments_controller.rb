class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build(comments_params)
    #binding.pry
    if @comment.save
      flash.now[:success] = "To see comment click"
      redirect_to root_url
    else
      flash[:danger] = "Cannot comment"
      render 'images/show'
    end
  end

  def destroy
    Comment.destroy(params[:id])
    #binding.pry
    redirect_to request.referrer || root_url
  end
  private

    def comments_params
      params.require(:comment).permit(:content, :image_id)
    end
end
