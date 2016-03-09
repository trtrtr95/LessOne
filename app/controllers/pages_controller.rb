class PagesController < ApplicationController
  before_filter :set_page, only: [:show, :create, :edit, :update]

  def index
    @pages = Page.roots
  end

  def show
    @pages = @page.children
  end

  def new
    @page = Page.new(parent_id: Page.find_id_by_names(params[:names]))
  end

  def new_root
    @page = Page.new
  end

def create
    @page = Page.new(create_params)

    if @page.save
      redirect_to page_path(@page.names)
    else
      render 'new'
    end
  end

  def create_root
    @page = Page.new(create_params)

    if @page.save
      redirect_to page_path(@page.names)
    else
      render 'new_root'
    end
  end

  def edit; end

  def update
    if @page.update_attributes(create_params)
      redirect_to page_path(@page.names)
    else
      render 'edit'
    end
  end

  def destroy
    if @current_page.destroy
      redirect_to root_path, notice: [ t('pages.destroy.page_destroyed') ]
    else
      redirect_to show_path(:pages =>  @current_page_path), notice: [ t('pages.destroy.page_not_destroyed') ]
    end
  end

private

 def create_params 
   params.require(:page).permit(:name, :title, :html_text)
 end

  def set_page
    @page = Page.find_by_names(params[:names])
  end

end