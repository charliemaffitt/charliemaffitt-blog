class Post < ActiveRecord::Base
  before_save :format_text

  private

  def format_text
    self.formatted_body = Redcarpet::Markdown.new(Redcarpet::Render::HTML.new).render(raw_body)
  end
end
