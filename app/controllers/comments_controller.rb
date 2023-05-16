class CommentsController < ApplicationController
  before_action :authenticate_user!
  def new
    @comment = Comment.new
    @user = current_user
  end

  def create
    post = Post.find(params[:post_id])
    new_comment =
      Comment.create(
        post: post,
        author: current_user,
        text: comment_params['text'],
      )
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
