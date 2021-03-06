Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      post 'auth/request', to:'users#google_oauth2'
      get 'authenticate', to: 'sessions#authenticate'
      resources :sessions, only: :create
    end
  end
end
