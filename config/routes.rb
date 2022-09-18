Rails.application.routes.draw do
  resources :categories, except: :show
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :products, path: '/'
  # Defines the root path route ("/")
  # root "articles#index"
end
