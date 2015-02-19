require 'markdown_renderer'
MarkdownRails.configure do |config|
  config.render do |markdown_source|
    MyMarkdown.renderer.render(markdown_source)
  end
end