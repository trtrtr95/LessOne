LessOne::Application.routes.draw do
   
  match 'add', controller: 'pages', action: 'new_root', as: 'add_root_page', via: :get
  match '/', controller: 'pages', action: 'create_root', via: :post
   
  match '*names/add', controller: 'pages', action: 'new', as: 'add_page', via: :get
  match '*names/edit', controller: 'pages', action: 'edit', as: 'edit_page', via: :get
  match '*names/delete', controller: 'pages', action: 'destroy', as: 'destroy_page', via: :delete
  match '*names', controller: 'pages', action: 'show', as: 'page', via: :get 
  match '*names', controller: 'pages', action: 'create', via: :post
  match '*names', controller: 'pages', action: 'update', via: :put

  root to: 'pages#index'
end
