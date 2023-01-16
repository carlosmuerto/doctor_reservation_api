Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  },
  defaults: { format: :json }

  get 'users/current', to: 'users#current'
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#current"

  resources :appointments, only: [:index, :create, :show, :update, :destroy], defaults: { format: :json }
  resources :doctors, only: [:index, :create, :show, :destroy], defaults: { format: :json }

  
end
