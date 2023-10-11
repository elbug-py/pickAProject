Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "static#home"

  devise_for :users

  resources :projects

  get 'profile', to: 'static#profile'

  get 'postulations', to: 'static#postulated_projects'
end
