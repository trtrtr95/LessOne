module ApplicationHelper
  def title(page_title, show_title = true)
    content_for(:title) { page_title.to_s }
    "<h1>#{page_title.to_s}</h1>".html_safe if show_title
  end
end
#Определяет заголовок
