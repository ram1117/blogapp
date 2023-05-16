class LikesController < ApplicationController
  before_action :authenticate_user!
  def create
    post = Post.find(params[:post_id])
    new_like = Like.create(post: post, author: current_user)
    if new_like.valid?
      flash[:success] = 'commented successfully'
      respond_to do |format|
        format.html { redirect_to request.referrer, notice: 'Liked' }
      end
    else
      flash[:alert] = 'error creating comment'
    end
  end
end
