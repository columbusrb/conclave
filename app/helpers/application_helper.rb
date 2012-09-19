module ApplicationHelper
  def admin_signed_in?
    user_signed_in? && current_user.role == 'admin'
  end
end
