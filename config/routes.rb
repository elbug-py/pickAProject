Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "static#home"

  devise_for :users

  get '/teachers', to: 'static#teachers'

  resources :projects do
    resources :inscriptions
  end

  resources :inscriptions do
    member do
      patch :accept
      patch :reject
    end
  end
end
