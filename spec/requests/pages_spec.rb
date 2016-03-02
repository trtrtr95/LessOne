require 'spec_helper'
class PageTest < ActiveSupport::TestCase
describe "Pages" do
	subject {page}


  describe "New page"  do
  	before { visit '/new'}
    it {should have_title ('')}
    it {should have_content ('')}
    it { should_not have_title('| Создание новой страницы') }
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
  
  end

  describe "Index page"  do
  	before { visit '/'}
    it {should have_title ('Все страницы сайта')}
    it {should have_content ('')}
    it { should_not have_title('| Все страницы сайта ') }
	end

	describe "Application page"  do
  	before { visit '/application'}
    it {should have_title ('Тестовый сайт')}
    it {should have_content ('')}
    it { should_not have_title('| Тестовый сайт ') }
	end

describe "_Form page"  do
  	before { visit '/_form'}
    it {should have_content ('')}
    FactoryGirl.define do
  sequence(:name) { |n| "Это четвертая страница" }
  sequence(:title) { |n| "Страница4" }
  sequence(:html_text) { |n| "Ку-ку ;)" }
end
	end


end
end
