class Api::PostsController < Api::ApiController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
    render json: @posts, status: 200
  end

  def show
    @post = Post.find(params[:id])
    render json: @post, status: 200
  end
end
