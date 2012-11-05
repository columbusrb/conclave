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
  def markdown(markdown_text)

    options = {
      :autolink           => true,
      :filter_html        => true,
      :no_styles          => true,
      :safe_links_only    => true,
      :hard_wrap          => true,
      :fenced_code_blocks => true,
      :no_intra_emphasis  => true,
      :autolink           => true,
      :strikethrough      => true,
      :lax_html_blocks    => true,
      :superscript        => true,
    }

    markdown_to_html = Redcarpet::Markdown.new(Redcarpet::Render::HTML, options)
    markdown_to_html.render(markdown_text).html_safe
  end
end
