Rails.application.routes.draw do
  get 'password_resets/new'
  get 'password_resets/edit'
  get 'sessions/new'
	# GET / => static_pages(コントローラー)#(の)index(アクション)
	root "static_pages#home" # testでは「get root_url」として扱われる

	# # GET /static_pages/home => static_pages(コントローラー)#(の)home(アクション)
	# # 「/」はURLの意とアクションの意を密結合している
  # get 'static_pages/home' # testでは「get static_pages_home_url」として扱われる
  # get 'static_pages/help'
	# get  "static_pages/about"
	# get  "static_pages/contact"
	# get 'users/new'

	# 「to:」を使うことでURLの意とアクションの意を疎結合にする
	get "/help", to: "static_pages#help" # testでは「get help_path」として扱われる
	get "/about", to: "static_pages#about"
	get "/contact", to: "static_pages#contact"
	get "/signup", to: "users#new"
	get    "/signup",  to: "users#new"
  get    "/login",   to: "sessions#new"
  post   "/login",   to: "sessions#create"
  delete "/logout",  to: "sessions#destroy"
	# resources :users
	resources :users do
    member do
      get :following, :followers
    end
  end
	resources :account_activations, only: [:edit]
	resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :microposts,          only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]
	get '/microposts', to: 'static_pages#home'


end
