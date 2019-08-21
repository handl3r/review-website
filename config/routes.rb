Rails.application.routes.draw do
  get 'static_pages/home'
  get  '/about', to: 'static_pages#about'
  get '/search', to: 'static_pages#search'
  get '/search_result', to: 'static_pages#search_result'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: {sessions: 'users/sessions', registrations: 'users/registrations'}
  #get '/user/show/:id' => 'users#show'
  resources :users, :only => [:show]
  resources :places
  resources :reviews
  root to: 'static_pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
