class Page < ActiveRecord::Base
  # Задаётся при создании новой страницы - указывается путь родителя
attr_writer :parent_path 

  validates :name, format: {with: /[а-яА-ЯёЁa-zA-Z0-9_]/, message: I18n.t('activerecord.attributes.errors.invalid_name') },
                   uniqueness: true, presence: true
  validates :path, uniqueness: true

  before_create :set_path
  after_destroy :delete_child_pages

  # Cортирует данные сразу в подходящем порядке для выдачи
  scope :tree, lambda { |id = nil|
    page = Page.where(id: id).first if id
    if page
      where("\"path\" LIKE '%#{page.path}/%'").order(:path)
    else
      order(:path)
    end
  }

  scope :by_path, ->(path) { where path: path }

private

  def set_path
    # Новый путь - это путь родителя + \ + name новой страницы
    self.path = @parent_path.blank? ? "" : @parent_path + '/'
    self.path += self.name
  end

  def delete_child_pages
    # Удаляем все пути, начинающиеся с удаляемого без вызова колбэков
    Page.delete_all("\"path\" LIKE '#{self.path}/%'")
  end
end