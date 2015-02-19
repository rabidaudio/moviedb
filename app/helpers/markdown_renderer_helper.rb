module MarkdownRendererHelper
  def markdown_render data
    MyMarkdown.renderer.render data
  end
end
