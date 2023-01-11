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

  resources :users, only: [:index, :create, :login] do
  resources :appointments, only: [:index, :create, :show, :update, :destroy]
  resources :doctors, only: [:create, :destroy]

  end

  post 'users/login', to: 'users#login'
  post '/doctors/:id/appointments', to: 'appointments#create_on_doctors'
  get '/users/:id/doctors', to: 'doctors#show_user_doctors'   
  get '/appointments', to: 'appointments#show_all'
  get '/appointments/:id', to: 'appointments#show'

  get '/doctors', to: 'doctors#index'   
  get '/doctors/:id', to: 'doctors#show'
  put '/doctors/:id', to: 'doctors#update'

  
 end

end
