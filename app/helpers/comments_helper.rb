module CommentsHelper
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
