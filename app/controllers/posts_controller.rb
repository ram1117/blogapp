class PostssController < ActionController
  def index
    @posts = Post.all
  end
  def show
    @post = Post.find(params[:id])
  end
end
