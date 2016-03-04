module PagesHelper
  
  def read_html text
    text.html_safe
  end

  # Ищет путь родителя элемента по текущему пути
  def parent_path current_page_path
    path = current_page_path.split('/')
    path.pop
    path == [] ? nil : path.join('/')
  end

  # Определяет глубину вложенности подстраницы относительно текущей страницы
  def level page, current_page
    page_lvl = page.path.split('/').length - 1
    current_page_lvl = current_page ? (current_page.path.split('/').length - 1) : 0
    page_lvl - current_page_lvl
  end
end