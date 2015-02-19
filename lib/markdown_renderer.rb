module MyMarkdown
  def self.renderer
    @renderer ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML,
      :fenced_code_blocks => true,
      :autolink => true,
      :with_toc_data => true
    )
  end
end