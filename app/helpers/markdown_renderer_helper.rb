module MarkdownRendererHelper
  def markdown_render data
    renderer.render data
  end

  private
  def renderer
    @renderer ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML.new(with_toc_data: true))
  end
end
