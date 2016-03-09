class Page < ActiveRecord::Base
  has_ancestry

  validates :name, presence: true, uniqueness: true, format: { with: /[a-zA-Zа-яА-Я0-9_]/ }
  validates :title, presence: true

  before_save :format_body
  after_destroy :delete_child_pages

  def names
    path.map(&:name).join('/')
  end

  # Возвращает объект страницы по пути
  def self.find_by_names(names) 
    return nil if names.nil?
    last_name = names.split("/").last
    find_by_name(last_name)
  end

  # Возвращает id объекта страницы из строки пути
  def self.find_id_by_names(names) 
    return nil if names.nil?
    find_by_names(names).id
  end

  # Преобразует тэги в html тэги
  def format_body 
    return nil if body.nil?
    bold_regexp = Regexp.new('\*\*(?<text>.+)\*\*')
    italic_regexp = Regexp.new('\\\\\\\\(?<text>.+)\\\\\\\\')
    a_regexp = Regexp.new('\(\((?<path>[^\s]+)\s(?<text>.+)\)\)')

    self.formatted_body = body.gsub(bold_regexp, '<b>\k<text></b>').
                               gsub(italic_regexp, '<i>\k<text></i>').
                               gsub(a_regexp, '<a href="/\k<path>">\k<text></a>')
  end

  def delete_child_pages
    # Удаляем все пути, начинающиеся с удаляемого без вызова колбэков
    Page.delete_all("\"path\" LIKE '#{self.path}/%'")
  end
end
