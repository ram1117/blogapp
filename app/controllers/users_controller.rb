class UsersController < ApplicationController
  layout 'users'
  before_action :authenticate_user!
  def index
    @users = User.all.order(updated_at: :asc)
    @current_user = current_user
  end

  def show
    @user = User.find(params[:id])
  end
end
