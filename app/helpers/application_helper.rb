module ApplicationHelper
  def admin_signed_in?
    user_signed_in? && current_user.role == 'admin'
  end
  def timeago(time, options = {})
    options[:class] ||= "timeago"
    content_tag(:time, time.to_s, options.merge(:datetime => time.getutc.iso8601)) if time
  end
end
