Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get '/index.html', to: redirect('/')

  root 'index#index', controller: IndexController

  get '/about' => 'pages#about'
  get '/calculator' => 'pages#calculator'
  get '/delivery' => 'pages#delivery'
  get '/products', to: redirect('/catalog/product')

  get '/catalog', to: redirect('/catalog/product')

  get '/catalog/:filter' => 'catalog#index'

  get '/checkout', to: redirect('/checkout/step1')

  get '/contacts' => 'contacts#index'

  get '/sitemap.xml' => 'pages#sitemap'

  resources :news, only: [:index, :show]
  resources :products, only: [:index, :show]
  # resources :catalog, only: :index
  resources :order_items, only: [:create, :update, :destroy]
  resource :contact
  resolve("Contact") {[:contact]}


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
