module ApplicationHelper
  def admin_signed_in?
    user_signed_in? && current_user.role == 'admin'
  end

  def timeago(time, options = {})
    options[:class] ||= "timeago"
    content_tag(:time, time.to_s, options.merge(:datetime => time.getutc.iso8601)) if time
  end

  def glyphicon(icon_name, opts = {})
    title = (opts[:title].present?) ? opts[:title] : ""
    klass = (opts[:color] == 'white') ? "#{icon_name} icon-white" : icon_name
    icon  = content_tag(:b, '', class: klass, title: title)
    icon  = (opts[:text].present?) ? "#{opts[:text] + ' ' + icon}" : icon
    return sanitize icon
  end
end
