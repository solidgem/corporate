module ApplicationHelper
  def menu_item(model, action, name, url, link_options = {})
    return unless policy(model).send "#{action}?"
    content_tag :li do
      link_to name, url, link_options
    end
  end

  def markdown_render(text)
    find_and_preserve sanitize GitHub::Markdown.render_gfm(text)
  end
end
