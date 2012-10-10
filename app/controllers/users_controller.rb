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

  def my_conversations
    @conversations = current_user.conversations
  end

  def update
    if params[:user][:email] && params[:user][:password] == params[:user][:password_confirmation]
      current_user.email                 = params[:user][:email]
      current_user.password              = params[:user][:password]
      current_user.password_confirmation = params[:user][:password_confirmation]

      if current_user.save
        redirect_to root_url
      else
        flash[:alert] = current_user.errors.full_messages
        render "devise/omniauth_callbacks/email_pease"
      end
    else
      redirect_to email_pease_path
    end
  end

end
