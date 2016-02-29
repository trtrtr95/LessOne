# coding: utf-8  
ActiveAdmin.register Page do  

  controller do  
    def new  
      @page = Page.new  
      @page.build_seo   # без этой строки не появляется форма для seo параметров  
    end  
    def edit  
      @article = Article.find(params[:id])  
      if @article.seo_id.nil?  
        @article.build_seo  
      end  
    end  
  end  

  form do |f|  
    f.inputs "Страница" do # Настройка поле таблицы  
      f.input :title  
      f.input :slug  
      f.input :body  
      f.input :visible  
    end  
    f.inputs "SEO" do  # Настройка полей SEO  
      f.semantic_fields_for :seo do |j|  
        j.inputs :title, :keywords, :description  
      end  
    end  
    f.buttons  
  end  
end  