class LikesController < ApplicationController
  def create
    user = ApplicationController.current_user
    post = Post.find(params[:post_id])
    new_like = Like.create(post: post, author: user)
    if new_like.save
      flash[:success] = 'commented successfully'
      # redirect_to user_post_path(user.id, post.id)
      respond_to do |format|
        format.html { redirect_to request.referrer, notice: 'Liked' }
      end
    else
      flash[:alert] = 'error creating comment'
    end
  end
end
