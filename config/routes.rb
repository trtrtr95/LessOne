LessOne::Application.routes.draw do
   
  scope '(*pages)' do
    get    '/add',     to: 'pages#new'
    get    '/edit',    to: 'pages#edit'
    patch    '/update',  to: 'pages#update'
    delete '/destroy', to: 'pages#destroy'
    get    '/',        to: 'pages#show',    :as => 'show'
    post   '/create',  to: 'pages#create'
  end 
   root :to => 'pages#show'

  
 
end

