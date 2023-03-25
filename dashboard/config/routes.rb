Rails.application.routes.draw do

  root 'home#index'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html


  resources :studies do
    resources :graphs, only: [:new, :create, :destroy, :edit, :update]
  end

  resources :graphs
  resources :studies

  

  # Defines the root path route ("/")
  # root "articles#index"
end
