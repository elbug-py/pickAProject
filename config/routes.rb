Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "static#home"

  devise_for :users, controllers: { registrations: 'registrations' }

  get 'profile', to: 'static#profile'

  get 'postulations', to: 'static#postulated_projects'

  get 'search_projects', to: "projects#search_projects"

  get '/teachers', to: 'static#teachers'

  get '/:teacher_id/teacher_projects', to: 'static#teacher_projects', as: "teacher_projects"

  resources :projects do
    resources :inscriptions
    # collection do
    #   get 'search'
    # end
  end
  resources :notifications
  resources :inscriptions do
    member do
      patch :accept
      patch :reject
    end
  end

  resources :projects do
    member do
      patch :open
      patch :close
    end
  end

end
