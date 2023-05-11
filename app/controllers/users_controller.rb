class UsersController < ApplicationController
  layout 'users'
  def index
    @users = User.all
    @current_user = ApplicationController.current_user
  end

  def show
    @user = User.find(params[:id])
  end
end
