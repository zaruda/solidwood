Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root 'index#index', controller: IndexController

  get '/about' => 'pages#about'
  get '/calculator' => 'pages#calculator'
  get '/delivery' => 'pages#delivery'
  get '/catalog/:filter' => 'catalog#index'

  get '/catalog', to: redirect('/catalog/product')
  get '/checkout', to: redirect('/checkout/step1')

  get '/contacts' => 'pages#contacts'

  resources :news, only: [:index, :show]
  resources :products, only: [:index, :show]
  resources :catalog, only: :index
  resources :order_items, only: [:create, :update, :destroy]

  # get '/cart/step1' => 'wizard#step1'
  # get '/cart/step2' => 'wizard#step2'
  # get '/cart/step3' => 'wizard#step3'


  resource :wizard, path: '/checkout' do
    get :step1
    get :step2
    get :thanks

    post :validate_step
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
