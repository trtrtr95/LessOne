class PagesController < ApplicationController
  before_filter :get_page
  before_filter :check_for_current_page, :only => [:edit, :update, :destroy]
  before_filter :check_for_invalid_path, :only => [:new, :show, :create]

  def index
    @pages = Page.where(:parent_id => nil)
    render :index
  end

  def create
    @page = Page.new(create_params)
     if @page.save
      redirect_to show_path(:pages => @page.path), notice: [ t('pages.create.page_created') ]
    else
      redirect_to add_path(:pages =>  @current_page_path), alert: @page.errors
    end
  end

  def new
    @page = Page.new
    render :new
  end

  def edit
    @page = @current_page
  end

  # Show перехватывает возможные обращения к экшенам index и new,
  # когда  мы находимся на главной странице.
  def show
    @page = @current_page
    new if params[:pages] == 'add'
    index unless params[:pages]
  end

  def update
    if @current_page.update_attributes(update_params)
      redirect_to show_path(:pages =>  @current_page_path), notice: [ t('pages.update.page_updated') ]
    else
      redirect_to edit_path(:pages =>  @current_page_path), alert: @current_page.errors
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

 def get_page
  @current_page = Page.where(:path => params[:pages]).first
 @current_page_path =  @current_page.path if @current_page
  end

  def check_for_current_page
    redirect_to root_path, :alert => [ t('invalid_path') ] unless @current_page
  end

  def check_for_invalid_path
    redirect_to root_path, :alert => [ t('invalid_path') ] if @current_page.nil? && !params[:pages].nil?
  end

  def create_params 
params.require(:page).permit(:name, :title, :html_text).merge(:parent_path => @current_page_path)
  end

  def update_params
params.require(:page).permit(:title, :html_text)
  end

  def prepare_params right_columns
    params[:page].delete_if do |key, value|
      !right_columns.include? key
    end
  end
end