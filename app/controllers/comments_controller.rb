class CommentsController < ApplicationController
  def create
    user = ApplicationController.current_user
    input = params.require(:new_comment).permit(:text)
    post = Post.find(params[:post_id])
    new_comment = Comment.create(post: post, author: user, text: input['text'])
    if new_comment.save
      flash[:success] = 'commented successfully'
      redirect_to user_post_path(user.id, post.id)
    else
      flash[:alert] = 'error creating comment'
    end
  end
end
