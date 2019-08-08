Rails.application.routes.draw do
  get 'static_pages/home'
  get 'static_pages/about'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: {sessions: 'users/sessions', registrations: 'users/registrations'}
  #get '/user/show/:id' => 'users#show'
  resources :users, :only => [:show]
  resources :places
  resources :reviews
  root to: 'pages#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
