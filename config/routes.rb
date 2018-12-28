Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root 'index#index', controller: IndexController

  get '/about' => 'pages#about'
  get '/catalog' => 'pages#catalog'

  # resources :pages
  resources :news, only: [:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
