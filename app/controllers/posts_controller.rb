class PostsController < ApplicationController
  layout 'posts'
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def create
    user = ApplicationController.current_user
    input = params.require(:new_post).permit(:title, :text)
    new_post =
      Post.new(
        author: user,
        title: input['title'],
        text: input['text'],
        likes_counter: 0,
        comments_counter: 0
      )

    if new_post.save
      flash[:success] = 'posted successfully'
      redirect_to user_post_path(user.id, new_post.id)
    else
      flash[:alert] = 'error creating post'
    end
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
  end
end
