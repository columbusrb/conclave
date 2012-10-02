class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :authenticate_admin_user!, :only => [:ban]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def ban
    User.find(params[:id]).ban!
    redirect_to :back
  end

end
