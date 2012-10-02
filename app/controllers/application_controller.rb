class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :check_for_banned_user

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

  def check_for_banned_user(user=nil, &block)
    user = current_user unless user.present?

    if user && (!user.elevated?) && (user_ban_check(user) || ip_ban_check(request.remote_ip))
      redirect_banned_user(user)
    end

    block.call if block_given?
  end

  protected

  def redirect_banned_user(user)
    banned_until = user.banned_until
    sign_out current_user if current_user.present?
    redirect_to root_url, alert: "Sorry, but you or your IP address are banned until #{banned_until}"
  end

  def user_ban_check(user)
    user.unban! if user.banned? && user.ban_over?
    user.banned?
  end

  def ip_ban_check(ip)
    User.unban_ip!(ip) if User.ip_banned?(ip) && User.ip_ban_over?(ip)
    User.ip_banned?(ip)
  end

end
