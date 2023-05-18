class Api::CommentsController < Api::ApiController
  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments
    render json: @comments, status: 200
  end

  def create
    user = User.find(params[:user_id])
    post = Post.find(params[:post_id])
    new_comment = Comment.new(author: user, post: post, text: params[:text])
    if new_comment.save
      render json: 'comment saved successfully', status: 200
    else
      render json: 'error saving comment', status: 400
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :post_id, :text)
  end
end
