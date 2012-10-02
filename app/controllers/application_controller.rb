class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :redirect_banned_user

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

  def redirect_banned_user(user=nil, &block)
    user = current_user unless user.present?

    if user && (user.banned? || User.ip_banned?(request.remote_ip))
      banned_until = user.banned_until
      sign_out current_user if current_user.present?
      redirect_to root_url, alert: "Sorry, but you or your IP address are banned until #{banned_until}"
    else
      block.call if block_given?
    end
  end

end
