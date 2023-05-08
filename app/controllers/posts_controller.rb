class PostssController < ActionController
  def index
    @posts = Post.all
  end

  def show
    @user = User.find(params[:user])
    @posts = @user.posts
  end
end
