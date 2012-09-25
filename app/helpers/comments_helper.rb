module CommentsHelper
  def markdown(markdown_text)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true,
                                                     filter_html: true,
                                                     no_styles: true,
                                                     safe_links_only: true)
    sanitize markdown.render(markdown_text)
  end
end
