class CommentsController < ApplicationController
  def create
    user = ApplicationController.current_user
    input = params.require(:new_comment).permit(:text)
    post = Post.find(params[:post_id])
    new_comment = Comment.create(post: post, author: user, text: input['text'])
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
end
