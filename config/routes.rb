Rails.application.routes.draw do
	# GET / => static_pages(コントローラー)#(の)index(アクション)
	root "static_pages#index"

	# GET /static_pages/home => static_pages(コントローラー)#(の)home(アクション)
	# 「/」はURLの意とアクションの意を密結合している
  get 'static_pages/home'
  get 'static_pages/help'
	get  "static_pages/about"
end
