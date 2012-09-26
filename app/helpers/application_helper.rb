module ApplicationHelper
  def admin_signed_in?
    user_signed_in? && current_user.role == 'admin'
  end
  def timeago(time, options = {})
    options[:class] ||= "timeago"
    content_tag(:time, time.to_s, options.merge(:datetime => time.getutc.iso8601)) if time
  end

  def glyphicon(icon_name, options = {})
    output_tag = ''
    if options[:color] == 'white'
      output_tag = content_tag(:b, '', class: "#{icon_name} icon-white")
    else
      output_tag = content_tag(:b, '', class: "#{icon_name}")
    end
    if options[:text].present?
      output_tag = options[:text] + ' ' + output_tag
    end
    return sanitize output_tag
  end
end
