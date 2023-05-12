class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @user = ApplicationController.current_user
  end

  def create
    user = ApplicationController.current_user
    post = Post.find(params[:post_id])
    new_comment =
      Comment.create(post: post, author: user, text: comment_params['text'])
    if new_comment.valid?
      flash[:success] = 'commented successfully'
      respond_to do |format|
        format.html do
          redirect_to request.referrer, notice: 'comment added successfully'
        end
      end
    else
      flash[:alert] = 'error creating comment'
    end
  end

  private

  def comment_params
    params.require(:new_comment).permit(:text)
  end
end
