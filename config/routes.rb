LessOne::Application.routes.draw do
  
 # scope '(*pages)' do
  #  get    '/add',     to: 'pages#new'
   # get    '/edit',    to: 'pages#edit'
 #   put    '/update',  to: 'pages#update'
  #  delete '/destroy', to: 'pages#destroy'
  #  get    '/',        to: 'pages#show',    :as => 'show'
  #  post   '/create',  to: 'pages#create'
 # end 

  root  'static_pages#home'
  match '/one', to: 'static_pages#one', via: 'get'
  match '/two', to: 'static_pages#two', via: 'get'
  match '/one/twoone', to: 'static_pages#twoone', via: 'get'
  match '/one/oneone', to: 'static_pages#oneone', via: 'get'
  match '/one/twoone/underone', to: 'static_pages#underone', via: 'get'
  match '/one/twoone/underone/new', to: 'static_pages#new', via: 'get'
 
end

