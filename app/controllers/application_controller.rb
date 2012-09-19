class ApplicationController < ActionController::Base
  protect_from_forgery

  def authenticate_admin_user!
    unless user_signed_in? && current_user.role == 'admin'
      flash[:alert] = 'Admins Only, Sorry.'
      redirect_to root_path
    end
  end

  def current_admin_user
    return nil if user_signed_in? && current_user.role != 'admin'
    current_user
  end

end
