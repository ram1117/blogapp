class UsersController < ActionController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:user])
  end
end
